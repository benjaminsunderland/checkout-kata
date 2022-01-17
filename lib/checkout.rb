require 'discount'

class Checkout
  attr_reader :scan, :basket, :total, :prices
  private :basket

  def initialize(prices)
    @prices = prices
    @discount = Discount.new(@prices, total=0)
  end

  def scan(item)
    basket << item.to_sym
  end

  def total         
    total = 0        

    basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }.each do |item, count|
      if item == :apple || item == :pear
        if (count % 2 == 0)
          @discount.apple_pear_discount(item)
        else
          @discount.base_price(item)
        end
      elsif item == :banana || item == :pineapple
        if item == :pineapple
          @discount.pineapple_discount(item)
        else
          @discount.banana_discount(item)
        end
      elsif item == :mango
        @discount.mango_discount(item)
      else
        @discount.base_price(item)
      end
    end

  return total

  end

  private

  def basket
    @basket ||= Array.new
  end
end