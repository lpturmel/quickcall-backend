defmodule QuickcallWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _room_id, _message, socket) do
    {:ok, socket}
  end

  def handle_in("new_msg", %{ "data" => data}, socket) do
    broadcast!(socket, "new_msg", %{data: data})
    {:noreply, socket}
  end

end
