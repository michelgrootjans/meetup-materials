# Find a function in module List which would help you implement the following:


defmodule ReduceList do
  def by(list, :sum), do: List.foldl(list, 0, fn(x, acc) -> x + acc end)
  def by(list, :multiplication), do: List.foldl(list, 1, fn(x, acc) -> x * acc end)
  def by(list, :concatenation),  do: List.foldl(list, "", fn(x, acc) -> x <> acc end)
end


ExUnit.start

defmodule ReduceListTest do
  use ExUnit.Case

  test "sum" do
    assert  [1,2,3,4] |> ReduceList.by(:sum) == 10
  end

  test "multiplication" do
    assert  [1,2,3,4] |> ReduceList.by(:multiplication) == 24
  end


  test "concatenation" do
    assert  ["1", "2", "3", "4"] |> ReduceList.by(:concatenation) == "4321"
  end

end
