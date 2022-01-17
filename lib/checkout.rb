require 'discount'

class Checkout
  attr_reader :scan, :basket, :total, :prices
  private :basket

  def initialize(prices)
    @prices = prices
    @discount = Discount.new(@prices)
  end

  def scan(item)
    basket << item.to_sym
  end

  def total         
    total = 0        

    basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }.each do |item, count|
      case item
      when :pear
        return total += @discount.apple_pear_discount(item, count) if (count % 2 == 0)
      when :apple
        return total += @discount.apple_pear_discount(item, count) if (count % 2 == 0)
      when :banana
        return total += @discount.banana_discount(item, count)
      when :pineapple
        return total += @discount.pineapple_discount(item, count)
      when :mango
        return total += @discount.mango_discount(item, count)
      else
        return total += @discount.base_price(item, count)
      end
    end
  end

  private

  def basket
    @basket ||= Array.new
  end
end
