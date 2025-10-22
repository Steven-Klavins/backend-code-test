require_relative 'discount_database'

class Discount
  def initialize
    @discount = DiscountDatabase.new
  end

  def apply(item, count, price)
    type = @discount.type(item)

    case type
    when :half_price
      half_price(item, count, price)
    when :buy_one_get_one_free
      buy_one_get_one_free(count, price)
    when :buy_3_get_1_free
      buy_3_get_1_free(count, price)
    else
      # If no key found nil is returned from the discounts hash meaning standard price.
      price * count
    end
  end

  private

  def buy_one_get_one_free(count, price)
    # Check odd numbers of pairs
    items = (count / 2) + (count % 2)
    items * price
  end

  def half_price(item, count, price)
    if @discount.one_per_customer?(item)
      (price / 2) + (price * (count - 1))
    else
      (price / 2) * count
    end
  end

  def buy_3_get_1_free(count, price)
    free_items = count / 4
    paid_count = count - free_items
    paid_count * price
  end
end
