defmodule SiteWeb.CoreComponentsTest do
  use ExUnit.Case, async: true

  alias SiteWeb.CoreComponents

  describe "tag_classes/1" do
    test "uses muted semantic colors for known post tags" do
      assert CoreComponents.tag_classes("elixir") == "bg-tag-elixir-bg/20 text-tag-elixir"
      assert CoreComponents.tag_classes("rust") == "bg-tag-rust-bg/25 text-tag-rust"
      assert CoreComponents.tag_classes("gamedev") == "bg-tag-gamedev-bg/20 text-tag-gamedev"

      assert CoreComponents.tag_classes("programming") ==
               "bg-tag-programming-bg/20 text-tag-programming"

      assert CoreComponents.tag_classes("devlog") == "bg-tag-devlog-bg/20 text-tag-devlog"
      assert CoreComponents.tag_classes("offtopic") == "bg-tag-offtopic-bg/25 text-tag-offtopic"
    end
  end
end
