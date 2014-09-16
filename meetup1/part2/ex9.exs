# Write a function which returns true if a string has the same number of
# opening and closing parentheses:

# Scan characters one by one and increment a number (initially 0) by 1
# when you see "(", decrement in case of a ")"

defmodule Parentheses do

  def balanced? (string) do
    characters = String.codepoints(string)

    count(characters) == 0
  end

  defp count([]), do: 0
  defp count(["(" | tail]), do: count(tail) + 1
  defp count([")" | tail]), do: count(tail) - 1
  defp count([_ | tail]),   do: count(tail)
end


ExUnit.start

defmodule ParenthesesTest do
  use ExUnit.Case

  test "balanced parentheses" do
    assert  Parentheses.balanced?("weih((rwkdfn)sle)rh")
  end

  test "too many opening parentheses" do
    assert  ! Parentheses.balanced?("weih((rwkdfn)sle)r)h")
  end

  test "too many closing parentheses" do
    assert  ! Parentheses.balanced?("w((eih((rwkdfn)sle)r)h")
  end

end



