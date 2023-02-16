defmodule PentoWeb.FAQLive.Index do
  use PentoWeb, :live_view

  alias Pento.AnswerDesk
  alias Pento.AnswerDesk.FAQ

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:greeting, "Welcome to Pento")
     |> assign(:faqs, list_faqs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New FAQ")
    |> assign(:faq, %FAQ{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Products")
    |> assign(:product, nil)
  end

  def list_faqs do
    AnswerDesk.list_faqs()
  end
end
