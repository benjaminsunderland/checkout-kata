require 'discount'

class Checkout
  attr_reader :basket
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
      when :pear   attr_reader :basket
        total += @discount.apple_pear_discount(item, count)
      when :apple
        total += @discount.apple_pear_discount(item, count)
      when :banana
        total += @discount.banana_discount(item, count)
      when :pineapple
        total += @discount.pineapple_discount(item, count)       
      when :mango
        total += @discount.mango_discount(item, count)
      else
        total += @discount.base_price(item, count)
      end
    end

    return total
  end

  private

  def basket
    @basket ||= Array.new
  end
end
