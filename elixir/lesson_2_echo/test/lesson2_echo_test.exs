defmodule Lesson2EchoTest do
  use ExUnit.Case
  doctest Lesson2Echo

  @error_msg "no function clause matching in Lesson2Echo.echo/2"

  test "reply to :ping message" do
    {:ok, pid} = Lesson2Echo.start_link()
    assert Lesson2Echo.echo(pid, :ping) == {:pong, :nonode@nohost}
    assert_receive {:pong, :nonode@nohost}
  end

  test "checking error message for wrong test arguments" do
    {:ok, pid} = Lesson2Echo.start_link()

    for test_message <- [%{}, "ppp", ~c"some", [], {:ping, "send"}, :qaz] do
      IO.inspect(test_message)
      assert_raise FunctionClauseError, @error_msg, fn ->
        Lesson2Echo.echo(pid, test_message)
      end
    end
  end
end
