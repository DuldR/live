defmodule PentoWeb.FAQLive.Show do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:greeting, "Welcome to Show")}
  end
end
