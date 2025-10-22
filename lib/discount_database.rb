class DiscountDatabase
  def initialize
    # Mimic discount DB
    @discounts = {
      apple: {type: :buy_one_get_one_free, one_per_customer: false},
      pear: {type: :buy_one_get_one_free, one_per_customer: false},
      banana: {type: :half_price, one_per_customer: false},
      pineapple: {type: :half_price, one_per_customer: true},
      mango: {type: :buy_3_get_1_free, one_per_customer: false}
    }
  end

  def type(item)
    @discounts[item]&.[](:type)
  end

  def one_per_customer?(item)
    @discounts[item]&.[](:one_per_customer)
  end
end