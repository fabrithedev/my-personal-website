defmodule Site.Bluesky do
  @moduledoc "Fetches and caches Bluesky posts."
  use GenServer

  alias Site.Bluesky.Post

  @refresh_interval :timer.minutes(15)
  @default_limit 10

  # Client API

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def get_posts(limit \\ @default_limit) do
    GenServer.call(__MODULE__, {:get_posts, limit})
  end

  # Server

  @impl true
  def init(_opts) do
    state = %{posts: [], handle: Application.fetch_env!(:site, :bluesky_handle)}
    send(self(), :refresh)
    {:ok, state}
  end

  @impl true
  def handle_call({:get_posts, limit}, _from, state) do
    {:reply, Enum.take(state.posts, limit), state}
  end

  @impl true
  def handle_info(:refresh, state) do
    posts = fetch_posts(state.handle)
    schedule_refresh()
    {:noreply, %{state | posts: posts}}
  end

  defp schedule_refresh do
    Process.send_after(self(), :refresh, @refresh_interval)
  end

  defp fetch_posts(handle) do
    url = "https://public.api.bsky.app/xrpc/app.bsky.feed.getAuthorFeed"
    case Req.get(url, params: [actor: handle, limit: 30, filter: "posts_no_replies"]) do
      {:ok, %{status: 200, body: %{"feed" => feed}}} ->
        Enum.map(feed, &Post.from_feed_item/1)

      {:ok, resp} ->
        require Logger
        Logger.warning("Bluesky API error: #{inspect(resp.status)}")
        []

      {:error, reason} ->
        require Logger
        Logger.warning("Bluesky API request failed: #{inspect(reason)}")
        []
    end
  end
end
