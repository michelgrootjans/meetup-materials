defmodule Coinchanger do
    def get_change amount do
        get_change(amount, [], [20, 10, 5, 2, 1])
    end

    def get_change(amount, change, _) when amount < 1 do
        Enum.reverse(change)
    end

    def get_change(amount, change, [coin | remaining_coins]) when coin > amount do
        get_change(amount, change, remaining_coins)
    end

    def get_change(amount, change, [coin | remaining_coins]) do
        get_change(amount - coin, change ++ [coin], [coin | remaining_coins])
    end
end
