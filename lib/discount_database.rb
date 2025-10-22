class DiscountDatabase
  def initialize
    # Mimic discount DB
    @discounts = {
      apple: :buy_one_get_one_free,
      pear: :buy_one_get_one_free,
      banana: :half_price,
      pineapple:  :half_price,
      mango: :buy_3_get_1_free
    }
  end

  def type(item)
    @discounts[item]
  end
end