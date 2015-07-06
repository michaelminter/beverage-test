module ApplicationHelper
  def units_sold_count
    Order.sold_count
  end

  def units_shipped_count
    Order.shipped_count
  end

  def default_sales_feed_items
    result = []
    Order.sales_feed.limit(2).each do |order|
      result << "<li><strong>#{order.first_name}</strong> #{order.city}, #{order.country}<br />#{order.quantity} units #{order.workflow_state}</li>"
    end
    result << ['<li></li>'] if result.empty?
    result.join.html_safe
  end
end
