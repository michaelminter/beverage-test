require 'test_helper'

describe ApplicationHelper do
  describe '#units_sold_count' do
    it 'returns sum of quantities for all orders' do
      units_sold_count.must_equal 20
    end
  end

  describe '#units_shipped_count' do
    it 'returns sum of quantities for orders with shipped workflow state' do
      units_shipped_count.must_equal 13
    end
  end

  describe '#default_sales_feed_items' do
    it 'should return last two orders as HTML' do
      default_sales_feed_items.must_equal '<li><strong>Mike</strong> Austin, <br />13 units shipped</li><li><strong>Michael</strong> Austin, <br />7 units ordered</li>'
    end
  end
end
