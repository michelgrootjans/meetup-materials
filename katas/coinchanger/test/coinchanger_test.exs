defmodule CoinchangerTest do
  use ExUnit.Case

  test "returns nothing when amount is 0" do
    assert Coinchanger.get_change(0) == []
  end

  test "returns one cent for one cent" do
    assert Coinchanger.get_change(1) == [1]
  end

  test "returns two cent for two cents" do
    assert Coinchanger.get_change(2) == [2]
  end

  test "returns [1,2] cent for 3 cents" do
    assert Coinchanger.get_change(3) == [1, 2]
  end

  test "returns [2,2] cent for 4 cents" do
    assert Coinchanger.get_change(4) == [2, 2]
  end

  test "returns [5] cent for 5 cents" do
    assert Coinchanger.get_change(5) == [5]
  end

  test "returns [2, 2, 5] cent for 9 cents" do
    assert Coinchanger.get_change(9) == [2, 2, 5]
  end

  test "returns [10] cent for 10 cents" do
    assert Coinchanger.get_change(10) == [10]
  end

  test "returns [2, 2, 5, 10] cent for 19 cents" do
    assert Coinchanger.get_change(19) == [2, 2, 5, 10]
  end

  test "returns [20] cent for 20 cents" do
    assert Coinchanger.get_change(20) == [20]
  end
end
