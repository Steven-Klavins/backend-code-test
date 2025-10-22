require 'spec_helper'
require_relative '../lib/discounts'

RSpec.describe Discount do
  subject(:discount) { described_class.new }

  describe '#apply' do
    context 'when a "buy one get one free" discount applies' do
      it 'charges for one when two items are purchased (e.g. apple)' do
        expect(discount.apply(:apple, 2, 100)).to eq(100)
      end

      it 'charges for two when three items are purchased (third is not free) (e.g. apple)' do
        expect(discount.apply(:apple, 3, 100)).to eq(200)
      end
    end

    context 'when a "half price" discount applies' do
      it 'applies a 50% reduction for each item (e.g. banana)' do
        expect(discount.apply(:banana, 1, 200)).to eq(100)
      end

      it 'applies the discount only once on items where one_per_customer is enabled (e.g. pineapple)' do
        expect(discount.apply(:pineapple, 3, 100)).to eq(250)
      end

      it 'applies half price correctly when buying a single item where one_per_customer is enabled (e.g. pineapple)' do
        expect(discount.apply(:pineapple, 1, 100)).to eq(50)
      end
    end

    context 'when a "buy 3 get 1 free" discount applies (e.g. mangoes)' do
      it 'makes the fourth item free' do
        expect(discount.apply(:mango, 4, 50)).to eq(150)
      end

      it 'charges full price if fewer than four items are purchased' do
        expect(discount.apply(:mango, 2, 50)).to eq(100)
      end

      it 'applies the discount proportionally for 5 items (4 paid + 1 free)' do
        expect(discount.apply(:mango, 5, 50)).to eq(200)
      end

      it 'applies multiple discounts when enough items are purchased' do
        expect(discount.apply(:mango, 8, 50)).to eq(300)
      end
    end

    context 'when an item has no discount' do
      it 'charges the standard total price' do
        expect(discount.apply(:orange, 3, 100)).to eq(300)
      end
    end
  end
end
