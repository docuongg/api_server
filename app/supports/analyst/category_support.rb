class Analyst::CategorySupport
  attr_accessor :categories

  def initialize
    @categories = Category.all.includes(:products)
  end

  def statistic
    categories.map do |category|
      {
        name: category.name,
        total_products: category.products.count,
        total_income: category.products.reduce(0) { |total, product| (total + product.purchased_products.joins(:order).where('orders.status != 4').sum(:price) )}
      }
    end
  end

end