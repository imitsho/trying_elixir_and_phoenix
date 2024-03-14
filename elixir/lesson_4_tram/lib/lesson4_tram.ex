defmodule Lesson4Tram do
  use GenServer

  @moduledoc """
  Логика работы трамвая
  """

  defstruct speed: 0, doors: :closed, incident: false, state: :stop

  def start_link do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_init_arg) do
    {:ok, %Lesson4Tram{}}
  end

  def get_state(tram_pid) do
    GenServer.call(tram_pid, :get_state)
  end

  def move(tram_pid) do
    GenServer.call(tram_pid, :move)
  end

  def stop(tram_pid) do
    GenServer.call(tram_pid, :stop)
  end

  def open_doors(tram_pid) do
    GenServer.call(tram_pid, :open_doors)
  end

  def close_doors(tram_pid) do
    GenServer.call(tram_pid, :close_doors)
  end

  def incident(tram_pid) do
    GenServer.call(tram_pid, :incident)
  end

  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  def handle_call(:move, _from, %Lesson4Tram{state: :stop} = tram),
    do: {:reply, :movement, %Lesson4Tram{tram | state: :movement, speed: 10}}

  def handle_call(:move, _from, %Lesson4Tram{state: :movement} = tram),
    do: {:reply, :movement, tram}

  def handle_call(:move, _from, %Lesson4Tram{state: state} = tram),
    do: {:reply, "Состояние #{state}, движение не возможно", tram}

  def handle_call(:stop, _from, %Lesson4Tram{state: :movement} = tram),
    do: {:reply, :stop, %Lesson4Tram{tram | state: :stop, speed: 0}}

  def handle_call(:stop, _from, %Lesson4Tram{state: :incident} = tram),
    do: {:reply, :incident, %Lesson4Tram{tram | state: :stop, speed: 0}}

  def handle_call(:stop, _from, %Lesson4Tram{state: _state} = tram),
    do: {:reply, :stop, %Lesson4Tram{tram | state: :stop}}

  def handle_call(:open_doors, _from, %Lesson4Tram{state: :stop} = tram),
    do: {:reply, :doors_are_opened, %Lesson4Tram{tram | state: :doors_are_opened, doors: :opened}}

  def handle_call(:open_doors, _from, %Lesson4Tram{state: :incident} = tram),
    do: {:reply, :doors_are_opened, %Lesson4Tram{tram | state: :doors_are_opened, doors: :opened}}

  def handle_call(:open_doors, _from, %Lesson4Tram{state: :doors_are_opened} = tram),
    do: {:reply, :doors_are_opened, tram}

  def handle_call(:open_doors, _from, %Lesson4Tram{state: state} = tram),
    do: {:reply, "Открытие дверей не возможно, трамвай в состоянии #{state}", tram}

  def handle_call(:close_doors, _from, %Lesson4Tram{state: :doors_are_opened} = tram),
    do: {:reply, :doors_are_closed, %Lesson4Tram{tram | state: :doors_are_closed, doors: :closed}}

  def handle_call(:close_doors, _from, %Lesson4Tram{state: _state} = tram),
    do: {:reply, "Двери закрыты, повторное закрытие не возможно", tram}

  def handle_call(:incident, _from, %Lesson4Tram{state: _state} = tram),
    do: {:reply, :incident, %Lesson4Tram{tram | state: :incident, doors: :opened, speed: 0}}
end
