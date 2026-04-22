defmodule Site.BlogTest do
  use ExUnit.Case
  alias Site.Blog

  describe "get_posts/2" do
    test "returns the latest N posts in descending order for a locale" do
      posts = Blog.get_posts(1, "en")

      assert length(posts) == 1
      assert hd(posts).id == "hello-world"
    end

    test "returns empty list when zero is passed" do
      posts = Blog.get_posts(0, "en")
      assert posts == []
    end

    test "raises FunctionClauseError when negative count is passed" do
      assert_raise FunctionClauseError, fn -> Blog.get_posts(-1, "en") end
    end

    test "returns all available posts when count exceeds total" do
      posts = Blog.get_posts(100, "en")
      assert length(posts) >= 3
    end

    test "filters by locale correctly" do
      en_count = Blog.get_posts(100, "en") |> length()
      pt_count = Blog.get_posts(100, "pt") |> length()
      zh_count = Blog.get_posts(100, "zh") |> length()

      assert en_count > 0
      assert pt_count > 0
      assert zh_count > 0
    end

    test "returns posts in descending date order" do
      posts = Blog.get_posts(100, "en")
      dates = Enum.map(posts, & &1.date)
      assert dates == Enum.sort(dates, &(Date.compare(&1, &2) != :lt))
    end

    test "returns posts in descending date order for pt locale" do
      posts = Blog.get_posts(100, "pt")
      dates = Enum.map(posts, & &1.date)
      assert dates == Enum.sort(dates, &(Date.compare(&1, &2) != :lt))
    end

    test "returns empty list when locale does not exist" do
      posts = Blog.get_posts(10, "xx")
      assert posts == []
    end
  end

  describe "get_post_by_id_and_locale/2" do
    test "returns the post for existing id and locale" do
      post = Blog.get_post_by_id_and_locale("second", "en")

      assert post.id == "second"
      assert post.language == "en"
      assert post.title == "Second"
    end

    test "returns the pt post for existing id and pt locale" do
      post = Blog.get_post_by_id_and_locale("teste-multilíngue", "pt")

      assert post.id == "teste-multilíngue"
      assert post.language == "pt"
      assert post.title == "Teste Multilíngue PT"
    end

    test "returns the zh post for existing id and zh locale" do
      post = Blog.get_post_by_id_and_locale("测试帖子", "zh")

      assert post.id == "测试帖子"
      assert post.language == "zh"
    end

    test "returns nil when post does not exist" do
      assert Blog.get_post_by_id_and_locale("nonexistent", "en") == nil
    end

    test "returns nil when locale does not match any post" do
      assert Blog.get_post_by_id_and_locale("hello-world", "xx") == nil
    end

    test "returns the correct post when multiple locales share similar IDs" do
      en_post = Blog.get_post_by_id_and_locale("multilingual-test", "en")
      assert en_post.language == "en"
      assert en_post.title == "Multilingual Test"
    end
  end

  describe "get_posts_by_tag/2" do
    test "returns all posts with the given tag for a locale" do
      posts_hello = Blog.get_posts_by_tag("hello", "en")
      assert length(posts_hello) == 2

      posts_world = Blog.get_posts_by_tag("world", "en")
      assert length(posts_world) >= 1
    end

    test "returns posts sorted by date descending" do
      posts = Blog.get_posts_by_tag("hello", "en")
      assert length(posts) >= 2

      dates = Enum.map(posts, & &1.date)
      assert dates == Enum.sort(dates, &(Date.compare(&1, &2) != :lt))
    end

    test "returns empty list when the tag does not exist" do
      posts = Blog.get_posts_by_tag("nonexistent", "en")
      assert posts == []
    end

    test "returns empty list when locale has no posts with the tag" do
      posts = Blog.get_posts_by_tag("hello", "pt")
      assert posts == []
    end

    test "returns posts filtered by both tag and locale" do
      blog_en = Blog.get_posts_by_tag("blog", "en")
      blog_pt = Blog.get_posts_by_tag("teste", "pt")

      assert length(blog_en) >= 1
      assert length(blog_pt) >= 1

      # Verify each post has the correct tag and language
      assert Enum.all?(blog_en, &(&1.language == "en" and "blog" in &1.tags))
      assert Enum.all?(blog_pt, &(&1.language == "pt" and "teste" in &1.tags))
    end

    test "raises FunctionClauseError when tag is nil" do
      assert_raise(FunctionClauseError, fn -> Blog.get_posts_by_tag(nil, "en") end)
    end

    test "raises FunctionClauseError when locale is nil" do
      assert_raise(FunctionClauseError, fn -> Blog.get_posts_by_tag("hello", nil) end)
    end
  end

  describe "get_tags/0" do
    test "returns all unique tags sorted alphabetically" do
      tags = Blog.get_tags()
      assert tags == Enum.sort(tags)
      assert "hello" in tags
      assert "world" in tags
    end

    test "includes tags from all locales" do
      tags = Blog.get_tags()
      assert "blog" in tags
      assert "teste" in tags
    end

    test "returns sorted list with no duplicates" do
      tags = Blog.get_tags()
      assert length(tags) == length(Enum.uniq(tags))
    end
  end

  describe "get_all_post_languages_by_id/1" do
    test "returns all language versions of a post as a map" do
      all_versions = Blog.get_all_post_languages_by_id("hello-world")
      assert is_map(all_versions)
      assert Map.has_key?(all_versions, "en")
      pt_version = all_versions["pt"]
      assert pt_version.language == "pt"
    end

    test "returns a single post map when only one locale exists" do
      all_versions = Blog.get_all_post_languages_by_id("third")
      assert is_map(all_versions)
      assert map_size(all_versions) == 1
      assert all_versions["en"].id == "third"
    end

    test "returns empty map for nonexistent id" do
      assert Blog.get_all_post_languages_by_id("nonexistent") == %{}
    end

    test "each version has the same id" do
      all_versions = Blog.get_all_post_languages_by_id("hello-world")
      assert Enum.all?(Map.values(all_versions), &(&1.id == "hello-world"))
    end
  end

  describe "get_all_posts/0" do
    test "returns all posts across all locales sorted by date descending" do
      posts = Blog.get_all_posts()
      assert length(posts) > 3

      dates = Enum.map(posts, & &1.date)
      assert dates == Enum.sort(dates, &(Date.compare(&1, &2) != :lt))
    end

    test "includes posts from all locales" do
      posts = Blog.get_all_posts()
      languages = Enum.map(posts, & &1.language) |> Enum.uniq()

      assert "en" in languages
      assert "pt" in languages
      assert "zh" in languages
    end

    test "returns all posts without filtering" do
      posts = Blog.get_all_posts()
      assert length(posts) >= 6
    end
  end
end
