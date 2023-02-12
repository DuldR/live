defmodule PentoWeb.WrongLive do
  alias Pento.Accounts
  alias PentoWeb.WrongLive
  use Phoenix.LiveView, layout: {PentoWeb.LayoutView, "live.html"}
  alias PentoWeb.Router.Helpers, as: Routes

  def mount(_params, session, socket) do
    {:ok,
     assign(socket,
       answer: answer(),
       time: time(),
       score: 0,
       message: "Make a guess:",
       session_id: session["live_socket_id"]
     )}
  end

  def handle_event("guess", %{"number" => guess} = data, socket) do
    if guess == socket.assigns.answer do
      message = "Your guess: #{guess}. You're Right."
      score = socket.assigns.score + 1

      {
        :noreply,
        assign(
          socket,
          answer: answer(),
          time: time(),
          message: message,
          score: score
        )
      }
    else
      message = "Your guess: #{guess}. You're Wrong."
      score = socket.assigns.score - 1

      {
        :noreply,
        assign(
          socket,
          time: time(),
          message: message,
          score: score
        )
      }
    end
  end

  def answer do
    Enum.random(1..10) |> Integer.to_string()
  end

  def time() do
    DateTime.utc_now() |> to_string
  end

  def render(assigns) do
    ~H"""
    <h1>Your score: <%= @score %></h1>
    <h1> Answer: <%= @answer %></h1>
    <%= if @score == 3 do%>
      <%= live_patch to: Routes.live_path(@socket, PentoWeb.WrongLive) do %>
        <button>
          Restart
        </button>

      <% end %>
    <% end %>

    <h2>
      <%= @message %>
      It's <%= @time %>
    </h2>

    <h2>

      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number={n} >
          <%= n %>
        </a>
      <% end %>
      <pre>
        <%= @current_user.email %>
        <%= @session_id %>

      </pre>
    </h2>


    """
  end
end
