module ApplicationHelper
  def units_sold_count
    Order.units_sold.count
  end

  def units_shipped_count
    Order.units_shipped.count
  end
end
