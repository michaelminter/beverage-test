module ApplicationHelper
  def units_sold_count
    Order.sold_count
  end

  def units_shipped_count
    Order.shipped_count
  end
end
