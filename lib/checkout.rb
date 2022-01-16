class Checkout
  attr_reader :scan, :basket, :total, :prices
  private :basket

  def initialize(prices)
    @prices = prices
  end

  def scan(item)
    basket << item.to_sym
  end

  def total
    total = 0

    prices.each {|key, value| scan(key)}

    basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }.each do |item, count|
      if item == :apple || item == :pear
        if (count % 2 == 0)
          total += @prices.fetch(item) * (count / 2)
        else
          total += @prices.fetch(item) * count
        end
      elsif item == :banana || item == :pineapple
        if item == :pineapple
          total += (@prices.fetch(item) / 2)
          total += (@prices.fetch(item)) * (count - 1)
        else
          total += (@prices.fetch(item) / 2) * count
        end
      else
        total += @prices.fetch(item) * count
      end
    end

    total
  end

  private

  def basket
    @basket ||= Array.new
  end
end