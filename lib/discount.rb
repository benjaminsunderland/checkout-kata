class Discount

    attr_reader :prices, :total

    def initialize(prices, total)
        @prices = prices
        @total = total
    end

    def apple_pear_discount(item)
        @total += @prices.fetch(item) * (count / 2)
    end

    def pineapple_discount(item)
        @total += (@prices.fetch(item) / 2)
        @total += (@prices.fetch(item)) * (count - 1)
    end

    def banana_discount(item)
        (@prices.fetch(item) / 2) * count
    end

    def mango_discount(item)
        @total += (prices.fetch(item) * count * 0.75).to_i
    end

    def base_price(item)
        @total += @prices.fetch(item) * count
    end

  end