defmodule Site.Blog do
  @moduledoc """
  A module for managing blog posts.
  It uses NimblePublisher to read markdown files from the `priv/posts` directory,
  and provides functions to retrieve posts and tags.
  """
  alias Site.Blog.Post

  posts_dir =
    case Mix.env() do
      :test -> Application.app_dir(:site, "priv/test_posts/**/*.md")
      _ -> Application.app_dir(:site, "priv/posts/**/*.md")
    end

  use NimblePublisher,
    build: Post,
    from: posts_dir,
    as: :posts,
    highlighters: [:makeup_elixir, :makeup_erlang],
    earmark_options: %Earmark.Options{smartypants: false}

  @tags @posts |> Enum.flat_map(& &1.tags) |> Enum.uniq() |> Enum.sort()

  defp all_posts, do: @posts

  defp all_tags, do: @tags

  @doc """
  Returns a list of all posts, sorted by date in descending order.
  """
  @spec get_posts(integer(), String.t()) :: [Post.t()]
  def get_posts(count, locale) when is_integer(count) and is_binary(locale) do
    all_posts()
    |> Enum.sort_by(& &1.date, {:desc, Date})
    |> Enum.filter(fn x -> x.language == locale end)
    |> Enum.take(count)
  end

  @doc """
  Returns the posts with the given id.
  """
  @spec get_all_post_languages_by_id(String.t()) :: [Post.t()]
  def get_all_post_languages_by_id(id) when is_binary(id) do
    all_posts()
    |> Enum.filter(fn x -> x.id == id end)
  end

  @doc """
  Returns the post with the given id and locale.
  """
  @spec get_post_by_id_and_locale(String.t(), String.t()) :: Post.t() | nil
  def get_post_by_id_and_locale(id, locale) when is_binary(id) and is_binary(locale) do
    all_posts()
    |> Enum.find(fn x -> x.id == id && x.language == locale end)
  end

  @doc """
  Returns all posts filtered by the given tag and locale.
  """
  @spec get_posts_by_tag(String.t(), String.t()) :: [Post.t()]
  def get_posts_by_tag(tag, locale) when is_binary(tag) and is_binary(locale) do
    all_posts()
    |> Enum.sort_by(& &1.date, {:desc, Date})
    |> Enum.filter(fn x -> tag in x.tags and x.language == locale end)
  end

  @doc """
  Returns all tags
  """
  @spec get_tags() :: [String.t()]
  def get_tags() do
    all_tags()
  end

  @doc """
  Returns all posts across all locales, sorted by date descending.
  Intended for use by the sitemap.
  """
  @spec get_all_posts() :: [Post.t()]
  def get_all_posts do
    all_posts() |> Enum.sort_by(& &1.date, {:desc, Date})
  end
end
