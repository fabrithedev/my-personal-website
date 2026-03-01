defmodule SiteWeb.CoreComponents do
  @moduledoc """
  Provides core UI components.

  At first glance, this module may seem daunting, but its goal is to provide
  core building blocks for your application, such as tables, forms, and
  inputs. The components consist mostly of markup and are well-documented
  with doc strings and declarative assigns. You may customize and style
  them in any way you want, based on your application growth and needs.

  The foundation for styling is Tailwind CSS, a utility-first CSS framework,
  augmented with daisyUI, a Tailwind CSS plugin that provides UI components
  and themes. Here are useful references:

    * [daisyUI](https://daisyui.com/docs/intro/) - a good place to get
      started and see the available components.

    * [Tailwind CSS](https://tailwindcss.com) - the foundational framework
      we build on. You will use it for layout, sizing, flexbox, grid, and
      spacing.

    * [Heroicons](https://heroicons.com) - see `icon/1` for usage.

    * [Phoenix.Component](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html) -
      the component system used by Phoenix. Some components, such as `<.link>`
      and `<.form>`, are defined there.

  """
  alias Phoenix.Flash
  use Phoenix.Component

  def flash(assigns) do
    ~H"""
    <div class="flash-messages">
      <%= if Flash.get(@flash, :info) do %>
        <div class="flash flash-info" role="alert">
          {Flash.get(@flash, :info)}
        </div>
      <% end %>

      <%= if Flash.get(@flash, :error) do %>
        <div class="flash flash-error" role="alert">
          {Flash.get(@flash, :error)}
        </div>
      <% end %>
    </div>
    """
  end

  @doc """
  Renders a Bluesky skeet.

  ## Examples

      <.skeet skeet={@skeet} />
  """
  attr(:skeet, :map, required: true)

  def skeet(assigns) do
    ~H"""
    <a
      href={@skeet.url}
      target="_blank"
      rel="noopener"
      class="group cursor-pointer flex-shrink-0 snap-start rounded-xl border border-white/[0.06] bg-white/[0.02] p-4 transition duration-300 hover:border-indigo-500/30 hover:bg-white/[0.04] hover:shadow-[0_0_30px_-5px_rgba(99,102,241,0.12)]"
    >
      <%= if @skeet.reposted_by do %>
        <div class="mb-2 flex items-center gap-1.5 text-[11px] text-gray-500">
          <svg
            class="h-3 w-3 text-indigo-400/70"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            viewBox="0 0 24 24"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M19.5 12c0-1.232-.046-2.453-.138-3.662a4.006 4.006 0 00-3.7-3.7 48.678 48.678 0 00-7.324 0 4.006 4.006 0 00-3.7 3.7c-.017.22-.032.441-.046.662M19.5 12l3-3m-3 3l-3-3m-12 3c0 1.232.046 2.453.138 3.662a4.006 4.006 0 003.7 3.7 48.656 48.656 0 007.324 0 4.006 4.006 0 003.7-3.7c.017-.22.032-.441.046-.662M4.5 12l3 3m-3-3l-3 3"
            />
          </svg>
          Reposted by {@skeet.reposted_by}
        </div>
      <% end %>
      <div class="mb-3 flex items-center gap-2.5">
        <%= if @skeet.author_avatar do %>
          <img
            src={@skeet.author_avatar}
            alt={@skeet.author_name}
            class="h-8 w-8 flex-shrink-0 rounded-full border border-white/[0.06]"
            loading="lazy"
          />
        <% end %>
        <div class="min-w-0 flex-1">
          <div class="flex items-baseline gap-1.5 text-sm">
            <span class="font-semibold text-gray-100">{@skeet.author_name}</span>
            <span class="text-xs text-gray-500">@{@skeet.author_handle}</span>
            <%= if @skeet.created_at do %>
              <span class="text-xs text-gray-600">·</span>
              <time
                datetime={DateTime.to_iso8601(@skeet.created_at)}
                class="text-xs text-gray-500"
              >
                {Calendar.strftime(@skeet.created_at, "%b %-d")}
              </time>
            <% end %>
          </div>
        </div>
      </div>
      <div class="flex gap-3">
        <p class="line-clamp-4 min-w-0 flex-1 text-sm leading-relaxed text-gray-300">
          {@skeet.text}
        </p>
        <%= if @skeet.images != [] do %>
          <div class="flex flex-shrink-0 gap-1.5">
            <%= for img <- @skeet.images do %>
              <img
                src={img.thumb}
                alt={img.alt}
                class="h-20 w-20 rounded border border-white/[0.06] object-cover"
                loading="lazy"
              />
            <% end %>
          </div>
        <% end %>
      </div>
      <div class="mt-3 flex items-center gap-4 text-[11px]">
        <span class="flex items-center gap-1 text-pink-400/80">
          <svg class="h-3.5 w-3.5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" />
          </svg>
          <span class="text-gray-300">{@skeet.like_count}</span>
        </span>
        <span class="flex items-center gap-1 text-indigo-400/80">
          <svg
            class="h-3.5 w-3.5"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            viewBox="0 0 24 24"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M19.5 12c0-1.232-.046-2.453-.138-3.662a4.006 4.006 0 00-3.7-3.7 48.678 48.678 0 00-7.324 0 4.006 4.006 0 00-3.7 3.7c-.017.22-.032.441-.046.662M19.5 12l3-3m-3 3l-3-3m-12 3c0 1.232.046 2.453.138 3.662a4.006 4.006 0 003.7 3.7 48.656 48.656 0 007.324 0 4.006 4.006 0 003.7-3.7c.017-.22.032-.441.046-.662M4.5 12l3 3m-3-3l-3 3"
            />
          </svg>
          <span class="text-gray-300">{@skeet.repost_count}</span>
        </span>
      </div>
    </a>
    """
  end
end
