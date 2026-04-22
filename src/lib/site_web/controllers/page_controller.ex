defmodule SiteWeb.PageController do
  use SiteWeb, :controller
  alias Site.Blog

  @supported_locales ~w(pt en zh)
  @default_description "Indie gamedev • Elixir, Rust and Godot experiments"

  def home(conn, _params) do
    locale = Gettext.get_locale(SiteWeb.Gettext)
    posts = Blog.get_posts(8, locale)
    tags = Blog.get_tags()
    skeets = Site.Bluesky.get_posts(10)

    render(conn, :home,
      posts: posts,
      tags: tags,
      skeets: skeets,
      current_tag: nil,
      layout: false,
      page_description: @default_description,
      canonical_url: url(~p"/?locale=#{locale}"),
      hreflang_alternates: Enum.map(@supported_locales, &{&1, url(~p"/?locale=#{&1}")}),
      json_ld_schema: %{
        "@context" => "https://schema.org",
        "@type" => "WebSite",
        "name" => "Fabri the Dev",
        "url" => SiteWeb.Endpoint.url(),
        "description" => @default_description,
        "sameAs" => [
          "https://github.com/fabrithedev",
          "https://bsky.app/profile/fabrithedev.com",
          "https://youtube.com/@fabrithedev"
        ]
      }
    )
  end

  def show(conn, %{"year" => year, "month" => month, "id" => id}) do
    locale = Gettext.get_locale(SiteWeb.Gettext)

    {post, conn} =
      case Blog.get_post_by_id_and_locale(id, locale) do
        nil ->
          conn_with_flash = put_flash(conn, :error, gettext("post-not-found-locale"))

          {Blog.get_post_by_id_and_locale(
             id,
             Application.get_env(:site, SiteWeb.Gettext)[:default_locale]
           ), conn_with_flash}

        post ->
          {post, conn}
      end

    if post == nil do
      conn
      |> put_flash(:error, gettext("post-not-found-locale"))
      |> redirect(to: ~p"/")
    else
      post_year = Integer.to_string(post.date.year)
      post_month = post.date.month |> Integer.to_string()

      if year != post_year or month != post_month do
        path = ~p"/posts/#{post.date.year}/#{post.date.month}/#{post.id}"

        conn
        |> put_status(:moved_permanently)
        |> Phoenix.Controller.redirect(to: path, status: 301)
        |> halt()
      else
        post_path = ~p"/posts/#{post.date.year}/#{post.date.month}/#{post.id}"
        base_url = SiteWeb.Endpoint.url()
        all_versions = Blog.get_all_post_languages_by_id(post.id)

        hreflang_alternates =
          Enum.map(all_versions, fn p ->
            {p.language, "#{base_url}#{post_path}?locale=#{p.language}"}
          end)

        render(conn, :show,
          post: post,
          page_title: post.title,
          page_description: post.description,
          canonical_url: "#{base_url}#{post_path}?locale=#{post.language}",
          hreflang_alternates: hreflang_alternates,
          json_ld_schema: %{
            "@context" => "https://schema.org",
            "@type" => "BlogPosting",
            "headline" => post.title,
            "description" => post.description,
            "datePublished" => Date.to_iso8601(post.date),
            "inLanguage" => post.language,
            "author" => %{
              "@type" => "Person",
              "name" => post.author,
              "url" => base_url
            },
            "url" => "#{base_url}#{post_path}?locale=#{post.language}"
          }
        )
      end
    end
  end

  def about(conn, _params) do
    render(conn, :about,
      page_title: "About",
      page_description: @default_description,
      canonical_url: url(~p"/about"),
      json_ld_schema: %{
        "@context" => "https://schema.org",
        "@type" => "WebSite",
        "name" => "Fabri the Dev",
        "url" => SiteWeb.Endpoint.url(),
        "description" => @default_description
      }
    )
  end

  def posts(conn, %{"tag" => tag}) do
    locale = Gettext.get_locale(SiteWeb.Gettext)
    posts = Blog.get_posts_by_tag(tag)
    tags = Blog.get_tags()
    skeets = Site.Bluesky.get_posts(10)

    render(conn, :home,
      posts: posts,
      tags: tags,
      skeets: skeets,
      current_tag: tag,
      layout: false,
      page_description: @default_description,
      canonical_url: url(~p"/posts?tag=#{tag}&locale=#{locale}"),
      hreflang_alternates:
        Enum.map(@supported_locales, &{&1, url(~p"/posts?tag=#{tag}&locale=#{&1}")})
    )
  end

  def posts(conn, _params) do
    locale = Gettext.get_locale(SiteWeb.Gettext)
    posts = Blog.get_posts(8, locale)
    tags = Blog.get_tags()
    skeets = Site.Bluesky.get_posts(10)

    render(conn, :home,
      posts: posts,
      tags: tags,
      skeets: skeets,
      current_tag: nil,
      layout: false,
      page_description: @default_description,
      canonical_url: url(~p"/posts?locale=#{locale}"),
      hreflang_alternates: Enum.map(@supported_locales, &{&1, url(~p"/posts?locale=#{&1}")})
    )
  end
end
