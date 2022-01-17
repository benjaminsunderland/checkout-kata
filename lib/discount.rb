class Discount

    attr_reader :prices
    attr_writer :total

    def initialize(prices)
       @prices = prices
    end

    def apple_pear_discount(item, count)
        if (count % 2 == 0)
            @prices.fetch(item) * (count / 2)
          else
            @prices.fetch(item) * count
        end
    end

    def pineapple_discount(item, count)
       (@prices.fetch(item) / 2)
       (@prices.fetch(item)) * (count - 1)
    end

    def banana_discount(item, count)
       (@prices.fetch(item) / 2) * count
    end

    def mango_discount(item, count)
       (@prices.fetch(item) * count * 0.75).to_i
    end

    def base_price(item, count)
       @prices.fetch(item) * count
    end

  end