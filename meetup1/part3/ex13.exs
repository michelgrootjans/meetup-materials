# Write a converter of Roman numerals to decimal numerals.

# You need to compare each digit with the next digit (if any).
# If the first one is smaller the next one, the value of the first
# digit is subtracted from the result, in all other cases its value
# is added

# XIV :
# X is bigger than I, so:  +10
# I is smaller than V, so: -1
# V is the last digit, so: +5
# 10 - 1 + 5 = 14


defmodule RomanNumeral do

  def convert(roman_numeral)  do
    roman_numeral |> String.codepoints |> _convert
  end

  defp _convert([n | []]), do: roman_digit_to_decimal(n)

  defp _convert([n1, n2 | tail]) do
    arabic1 = roman_digit_to_decimal(n1)
    arabic2 = roman_digit_to_decimal(n2)
    if(arabic1 < arabic2) do
      _convert([ n2 | tail]) - arabic1
    else
      _convert([ n2 | tail]) + arabic1
    end
  end

  defp _convert([n | tail]) do
    _convert(tail) + roman_digit_to_decimal(n)
  end

  defp roman_digit_to_decimal("I"), do:    1
  defp roman_digit_to_decimal("V"), do:    5
  defp roman_digit_to_decimal("X"), do:   10
  defp roman_digit_to_decimal("L"), do:   50
  defp roman_digit_to_decimal("C"), do:  100
  defp roman_digit_to_decimal("D"), do:  500
  defp roman_digit_to_decimal("M"), do: 1000
  defp roman_digit_to_decimal(_),   do: raise "wat?"

end

ExUnit.start

defmodule RomanNumeralTest do
  use ExUnit.Case

  test "I",      do: assert RomanNumeral.convert("I")      == 1
  test "II",     do: assert RomanNumeral.convert("II")     == 2
  test "III",    do: assert RomanNumeral.convert("III")    == 3
  test "IIII",   do: assert RomanNumeral.convert("IIII")   == 4
  test "IV",     do: assert RomanNumeral.convert("IV")     == 4
  test "V",      do: assert RomanNumeral.convert("V")      == 5
  test "VI",     do: assert RomanNumeral.convert("VI")     == 6 
  test "VII",    do: assert RomanNumeral.convert("VII")    == 7
  test "VIII",   do: assert RomanNumeral.convert("VIII")   == 8
  test "IX",     do: assert RomanNumeral.convert("IX")     == 9
  test "X",      do: assert RomanNumeral.convert("X")      == 10
  test "XI",     do: assert RomanNumeral.convert("XI")     == 11
  test "XX",     do: assert RomanNumeral.convert("XX")     == 20
  test "XXII",   do: assert RomanNumeral.convert("XXII")   == 22
  test "MMXIV",  do: assert RomanNumeral.convert("MMXIV")  == 2014
  test "MDDXIV", do: assert RomanNumeral.convert("MDDXIV") == 2014
end
