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
end