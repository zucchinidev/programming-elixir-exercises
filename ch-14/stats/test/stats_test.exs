defmodule StatsTest do
  use ExUnit.Case
  use ExCheck
  doctest Stats

  describe "Stats on list of ints" do
    setup do
      [
        list: [1, 2, 3, 4],
        sum: 10,
        count: 4
      ]
    end

    test "calculates sum", fixture do
      assert Stats.sum(fixture.list) == fixture.sum
    end

    property "Single element list are their own sum" do
      for_all number in real() do
        Stats.sum([number]) == number
      end
    end

    test "calculate count", fixture do
      assert Stats.count(fixture.list) == fixture.count
    end

    property "count not negative" do
      for_all l in list(int), do: Stats.count(l) >= 0
    end

    test "calculate average", fixture do
      assert Stats.average(fixture.list) == fixture.sum / fixture.count
    end

    property "sum equals average times count" do
      for_all l in list(int) do
        implies length(l) > 0 do
          abs(Stats.sum(l) - Stats.count(l) * Stats.average(l)) < 1.0e-6
        end
      end
    end

    property "sum equals average times count (such_that)" do
      for_all l in such_that(l in list(int) when length(l) > 0) do
        abs(Stats.sum(l) - Stats.count(l) * Stats.average(l)) < 1.0e-6
      end
    end

    test "calculate average without values" do
      list = []
      assert_raise ArithmeticError, "bad argument in arithmetic expression", fn ->
        Stats.average(list) == 2.5
      end
    end
  end
end
