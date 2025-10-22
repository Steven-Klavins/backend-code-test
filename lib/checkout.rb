class Checkout
  def initialize(prices)
    @prices = prices
    @discount = Discount.new
    @basket = []
  end

  def scan(item)
    # Edge case for potential items not on record
    if @prices.key?(item)
      @basket << item.to_sym
    else
      puts "No price on record for item: #{item}"
    end
  end

  def total
    total = 0

    @basket.tally.each do |item, count|
      price = @prices.fetch(item)

      # A discount is only applied if one is found.
      discounted_total = @discount.apply(item, count, price)

      total += discounted_total
    end
    total
  end
end