class Analyst::ProductSupport
  attr_accessor :products, :from, :to
  
  def initialize
    @from = DateTime.now.beginning_of_month
    @to = DateTime.now.end_of_day
    @products = Product.all
  end

  def by_day product
    range_time_by_day.map do |day|
      {
        total_income: product.purchased_products.joins(:order).where("orders.status != 4 AND orders.created_at >= ? AND orders.created_at <= ?", day.beginning_of_day, day.end_of_day).sum(:price),
        day: day.strftime("%d-%m")
      }
    end
  end

  def statistic
    products.map do |product|
      purchased_popular_products = product.purchased_products.joins(:order).where('orders.status != 4 AND orders.created_at >= ? AND orders.created_at <= ?', from, to)
      {
        name: product.name,
        total_purchased: purchased_popular_products.count,
        total_income: purchased_popular_products.sum(:price),
        by_day: by_day(product)
      }
    end
  end 

  def desc_statistic
    statistic.sort_by! { |product| product[:total_income] }.reverse!
  end

  private

  def range_time_by_day
    dates = []
    current_date = from
    while current_date <= to
      dates.push(current_date)
      current_date = (current_date + 1.days).beginning_of_day
    end
    return dates
  end
end