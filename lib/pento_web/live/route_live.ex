defmodule PentoWeb.RouteLive do
  use Phoenix.LiveView, layout: {PentoWeb.LayoutView, "live.html"}
  alias PentoWeb.Router.Helpers, as: Routes

  def mount(_params, session, socket) do
    {:ok, redirect(socket, to: Routes.live_path(socket, PentoWeb.WrongLive))}
  end
end
