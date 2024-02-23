defmodule CalcTest do
  use ExUnit.Case
  doctest Lesson1Calc

  describe "addition" do
    test "addition", do: assert(Lesson1Calc.add(3, 3) == 6)

    test "addition with first float", do: assert(Lesson1Calc.add(3.0, 3) === 6.0)

    test "addition with second float", do: assert(Lesson1Calc.add(4, 3.0) === 7.0)

    test "raises error with not valid argumnet" do
      assert_raise RuntimeError, fn -> Lesson1Calc.div("3", "3") end
    end
  end

  describe "subtraction" do
    test "subtraction", do: assert(Lesson1Calc.sub(3, 4) == -1)

    test "subtraction with first float", do: assert(Lesson1Calc.sub(3.0, 3) === 0.0)

    test "subtraction with second float", do: assert(Lesson1Calc.sub(3, 4.0) === -1.0)

    test "raises error with not valid argumnet" do
      assert_raise RuntimeError, fn -> Lesson1Calc.div("2", "4") end
    end
  end

  describe "multiply" do
    test "multiply", do: assert(Lesson1Calc.multi(4, 3) == 12)

    test "multiply with first float", do: assert(Lesson1Calc.multi(4.0, 3) === 12.0)

    test "multiply with second float", do: assert(Lesson1Calc.multi(4, 3.0) === 12.0)

    test "raises error with not valid argumnet" do
      assert_raise RuntimeError, fn -> Lesson1Calc.div("4", "3") end
    end
  end

  describe "division" do
    test "division", do: assert(Lesson1Calc.div(12, 4) == 3)

    test "division with first float", do: assert(Lesson1Calc.div(12.0, 4) === 3.0)

    test "division with second float", do: assert(Lesson1Calc.div(12, 4.0) === 3.0)

    test "raise error with division on 0" do
      assert_raise RuntimeError, fn -> Lesson1Calc.div(12, 0) end
    end

    test "raises error with not valid argumnet" do
      assert_raise RuntimeError, fn -> Lesson1Calc.div("12", "4") end
    end
  end
end
