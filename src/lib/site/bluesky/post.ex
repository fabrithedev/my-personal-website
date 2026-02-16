defmodule Site.Bluesky.Post do
  @moduledoc "Represents a Bluesky post."

  @type t :: %__MODULE__{
          uri: String.t() | nil,
          cid: String.t() | nil,
          text: String.t() | nil,
          created_at: DateTime.t() | nil,
          like_count: non_neg_integer(),
          repost_count: non_neg_integer(),
          reply_count: non_neg_integer(),
          url: String.t() | nil,
          images: [map()],
          author_name: String.t() | nil,
          author_handle: String.t() | nil,
          author_avatar: String.t() | nil,
          reposted_by: String.t() | nil
        }

  defstruct [
    :uri,
    :cid,
    :text,
    :created_at,
    :url,
    :author_name,
    :author_handle,
    :author_avatar,
    :reposted_by,
    like_count: 0,
    repost_count: 0,
    reply_count: 0,
    images: []
  ]

  @spec from_feed_item(map()) :: t()
  def from_feed_item(%{"post" => post} = item) do
    record = post["record"]
    author = post["author"]
    rkey = post["uri"] |> String.split("/") |> List.last()

    %__MODULE__{
      uri: post["uri"],
      cid: post["cid"],
      text: record["text"],
      created_at: parse_datetime(record["createdAt"]),
      like_count: post["likeCount"] || 0,
      repost_count: post["repostCount"] || 0,
      reply_count: post["replyCount"] || 0,
      url: "https://bsky.app/profile/#{author["handle"]}/post/#{rkey}",
      images: parse_images(post["embed"]),
      author_name: author["displayName"],
      author_handle: author["handle"],
      author_avatar: author["avatar"],
      reposted_by: parse_repost_reason(item["reason"])
    }
  end

  defp parse_repost_reason(%{"$type" => "app.bsky.feed.defs#reasonRepost", "by" => by}) do
    by["displayName"] || by["handle"]
  end

  defp parse_repost_reason(_), do: nil

  defp parse_images(%{"$type" => "app.bsky.embed.images#view", "images" => images})
       when is_list(images) do
    Enum.map(images, fn img ->
      %{
        thumb: img["thumb"],
        fullsize: img["fullsize"],
        alt: img["alt"] || ""
      }
    end)
  end

  defp parse_images(_), do: []

  defp parse_datetime(nil), do: nil

  defp parse_datetime(str) do
    case DateTime.from_iso8601(str) do
      {:ok, dt, _} -> dt
      _ -> nil
    end
  end
end
