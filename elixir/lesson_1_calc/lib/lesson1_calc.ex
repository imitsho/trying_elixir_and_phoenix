defmodule Lesson1Calc do
  @moduledoc """
  Documentation for `Lesson1Calc`.
  """

  @doc """
  ## Addition

      iex> Lesson1Calc.add(3, 3)
      6

      iex> Lesson1Calc.add("4", "4")
      ** (RuntimeError) Bad argument!
  """
  @spec add(number(), number()) :: number()
  def add(x, y) when is_number(x) and is_number(y) do
    x + y
  end

  def add(_x, _y), do: raise("Bad argument!")

  @doc """
  ## Subtraction

    iex> Lesson1Calc.sub(3, 1)
    2

    iex> Lesson1Calc.sub("4", "2")
    ** (RuntimeError) Bad argument!
  """

  @spec sub(number(), number()) :: number()
  def sub(x, y) when is_number(x) and is_number(y) do
    x - y
  end

  def sub(_x, _y), do: raise("Bad argument!")

  @doc """
  ## Multuply

    iex> Lesson1Calc.multi(4, 4)
    16

    iex> Lesson1Calc.multi("4", "4")
    ** (RuntimeError) Bad argument!
  """

  @spec multi(number(), number()) :: number()
  def multi(x, y) when is_number(x) and is_number(y) do
    x * y
  end

  def multi(_x, _y), do: raise("Bad argument!")

  @doc """
  ## Division

    iex> Lesson1Calc.div(10, 2)
    5.0

    iex> Lesson1Calc.div(10, 0)
    ** (RuntimeError) Bad argument in arithmetic expression: second parametr can't be 0

    iex> Lesson1Calc.div("10", "3")
    ** (RuntimeError) Bad argument!
  """

  @spec div(number(), number()) :: float() | :error
  def div(_x, 0) do
    raise "Bad argument in arithmetic expression: second parametr can't be 0"
  end

  def div(x, y) when is_number(x) and is_number(y) do
    x / y
  end

  def div(_x, _y), do: raise("Bad argument!")
end
