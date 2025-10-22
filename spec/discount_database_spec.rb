require 'spec_helper'
require_relative '../lib/discount_database'

RSpec.describe DiscountDatabase do
  subject(:discount_db) { described_class.new }

  describe '#type' do
    context 'when the item has an associated discount' do
      it 'returns the correct discount type for the item' do
        expect(discount_db.type(:apple)).to eq(:buy_one_get_one_free)
      end
    end

    context 'when the item does not have an associated discount' do
      it 'returns nil' do
        expect(discount_db.type(:orange)).to be_nil
      end
    end
  end

  describe '#one_per_customer?' do
    context 'when the discount is limited to one per customer' do
      it 'returns true' do
        expect(discount_db.one_per_customer?(:pineapple)).to be true
      end
    end

    context 'when the discount is not limited to one per customer' do
      it 'returns false' do
        expect(discount_db.one_per_customer?(:apple)).to be false
      end

      it 'returns nil for items excluded from the hash' do
        expect(discount_db.one_per_customer?(:orange)).to be_nil
      end
    end
  end
end