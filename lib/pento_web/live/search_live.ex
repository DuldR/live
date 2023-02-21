defmodule PentoWeb.SearchLive do
  use PentoWeb, :live_view

  alias Pento.Search

  def mount(_socket, _session, socket) do
    {:ok, 
      socket
      |> assign(:search, %Search{})
      |> assign(:changeset, 
        Search.changeset(%Search{}, %{}))}
  end

  def handle_event("validate", %{"search" => search_params}, %{"assigns": %{search: search}} = socket) do

    changeset =
      search
      |> Search.changeset(search_params)
      |> Map.put(:action, :validate)


    {:noreply, 
      socket 
      |> assign(:changeset, changeset)
    }

  end

  def handle_event("search", params, socket) do
    {:noreply, socket}
  end

end
