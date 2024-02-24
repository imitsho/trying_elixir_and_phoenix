defmodule Lesson2Echo do
  use GenServer

  @moduledoc """
  Documentation for `Lesson2Echo`.
  """

  @doc """
  Simple echo server
  ## Examples
      iex> {:ok, pid} = Lesson2Echo.start_link()
      iex> Lesson2Echo.echo(pid, :ping)
      {:pong, :nonode@nohost}
  """

  # Client

  def start_link(default \\ %{}) do
    GenServer.start_link(__MODULE__, default)
  end

  def echo(pid, :ping) do
    GenServer.call(pid, :ping)
  end

  # Server (callbacks)

  @impl true
  def init(state) do
    IO.puts("I init module calls")
    {:ok, state}
  end

  @impl true
  def handle_call(:ping, {pid, _ref}, state) do
    IO.puts("I handle_call module calls")
    send(pid, {:pong, node()})
    {:reply, {:pong, node()}, state}
  end
end
