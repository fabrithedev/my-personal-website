defmodule SiteWeb.SitemapController do
  use SiteWeb, :controller
  alias Site.Blog

  def index(conn, _params) do
    posts = Blog.get_all_posts()
    base_url = SiteWeb.Endpoint.url()

    xml = build_sitemap(posts, base_url)

    conn
    |> put_resp_content_type("application/xml")
    |> send_resp(200, xml)
  end

  defp build_sitemap(posts, base_url) do
    static_urls =
      ~w(pt en zh)
      |> Enum.flat_map(fn locale ->
        [
          url_entry("#{base_url}/?locale=#{locale}", "weekly"),
          url_entry("#{base_url}/about?locale=#{locale}", "monthly")
        ]
      end)

    post_urls =
      Enum.map(posts, fn post ->
        path = "/posts/#{post.date.year}/#{post.date.month}/#{post.id}"
        url_entry("#{base_url}#{path}?locale=#{post.language}", "monthly", post.date)
      end)

    """
    <?xml version="1.0" encoding="UTF-8"?>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    #{Enum.join(static_urls)}#{Enum.join(post_urls)}</urlset>
    """
  end

  defp url_entry(loc, changefreq, lastmod \\ nil) do
    lastmod_tag = if lastmod, do: "  <lastmod>#{Date.to_iso8601(lastmod)}</lastmod>\n", else: ""

    """
    <url>
      <loc>#{loc}</loc>
    #{lastmod_tag}  <changefreq>#{changefreq}</changefreq>
    </url>
    """
  end
end
