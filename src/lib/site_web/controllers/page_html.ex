defmodule SiteWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use SiteWeb, :html

  embed_templates("page_html/*")

  def tag_classes(tag) do
    case String.downcase(tag) do
      "elixir" -> "bg-purple-500/15 text-purple-300"
      "devlog" -> "bg-pink-500/15 text-pink-300"
      "programming" -> "bg-cyan-500/15 text-cyan-300"
      "rust" -> "bg-orange-500/20 text-orange-400"
      "gamedev" -> "bg-green-500/15 text-green-300"
      "offtopic" -> "bg-blue-500/15 text-blue-300"
      _ -> "bg-gray-500/15 text-gray-300"
    end
  end
end
