defmodule Lesson4TramTest do
  use ExUnit.Case
  doctest Lesson4Tram

  test "get_state" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert %Lesson4Tram{state: :stop, incident: false, doors: :closed, speed: 0} = Lesson4Tram.get_state(pid)
  end

  test "stop -> move" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :movement = Lesson4Tram.move(pid)
  end

  test "move -> move" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :movement = Lesson4Tram.move(pid)
    assert :movement = Lesson4Tram.move(pid)
  end

  test "error: open_doors -> move" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :doors_are_opened = Lesson4Tram.open_doors(pid)
    assert "Состояние doors_are_opened, движение не возможно" = Lesson4Tram.move(pid)
  end

  test "move -> stop" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :movement = Lesson4Tram.move(pid)
    assert :stop = Lesson4Tram.stop(pid)
  end

  test "stop -> stop" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :stop = Lesson4Tram.stop(pid)
    assert :stop = Lesson4Tram.stop(pid)
  end

  test "open_doors -> stop" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :doors_are_opened = Lesson4Tram.open_doors(pid)
    assert :stop = Lesson4Tram.stop(pid)
  end

  test "incident -> stop" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :incident = Lesson4Tram.incident(pid)
    assert :incident = Lesson4Tram.stop(pid)
  end

  test "stop -> open_doors" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :doors_are_opened = Lesson4Tram.open_doors(pid)
  end

  test "open_doors -> open_doors" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :doors_are_opened = Lesson4Tram.open_doors(pid)
    assert :doors_are_opened = Lesson4Tram.open_doors(pid)
  end

  test "incident -> open_doors" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :incident = Lesson4Tram.incident(pid)
    assert :doors_are_opened = Lesson4Tram.open_doors(pid)
  end

  test "open_doors -> close_doors" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :doors_are_opened = Lesson4Tram.open_doors(pid)
    assert :doors_are_closed = Lesson4Tram.close_doors(pid)
  end

  test "close_doors -> close_doors" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert "Двери закрыты, повторное закрытие не возможно" = Lesson4Tram.close_doors(pid)
    assert "Двери закрыты, повторное закрытие не возможно" = Lesson4Tram.close_doors(pid)
  end

  test "incident -> close_doors" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :incident = Lesson4Tram.incident(pid)
    assert "Двери закрыты, повторное закрытие не возможно" = Lesson4Tram.close_doors(pid)
  end

  test "incident -> incident" do
    {:ok, pid} = Lesson4Tram.start_link()
    assert :incident = Lesson4Tram.incident(pid)
  end
end
