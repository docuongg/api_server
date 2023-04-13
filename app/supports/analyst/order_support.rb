class Analyst::OrderSupport
  attr_accessor :params, :from, :to, :search

  def initialize params
    @params = params
    @from = start_time
    @to = end_time
    @search = Order.not_canceled.where(created_at: start_time.beginning_of_day..end_time.end_of_day)
  end

  def general
    {
      total_income: search.sum(:total_price),
      total_orders: search.count,
      average_income: (search.sum(:total_price)/(range_time_by_day.count)).round(2)
    }
  end

  def by_day
    range_time_by_day.map do |date|
      total_income = search.find_by_day(date).sum(:total_price)
      total_orders = search.find_by_day(date).count
      {
        total_income: total_income,
        total_orders: total_orders,
        day: date.strftime("%d-%m-%Y")
      }
    end
  end

  def by_month
    range_time_by_month.map do |month|
      total_income = search.find_by_month(month).sum(:total_price)
      total_orders = search.find_by_month(month).count
      {
        total_income: total_income,
        total_orders: total_orders,
        month: month.strftime("%m-%Y")
      }
    end
  end

  def by_year
    range_time_by_year.map do |year|
      total_income = search.find_by_year(year).sum(:total_price)
      total_orders = search.find_by_year(year).count
      {
        total_income: total_income,
        total_orders: total_orders,
        year: year.strftime("%Y")
      }
    end
  end

  private

  def start_time
    params[:from].present? ? params[:from].to_date : Date.current.beginning_of_month
  end

  def end_time
    params[:to].present? ? params[:to].to_date : Date.current
  end

  def range_time_by_day
    dates = []
    current_date = from
    while current_date <= to
      dates.push(current_date)
      current_date = (current_date + 1.days).beginning_of_day
    end
    return dates
  end

  def range_time_by_month
    dates = []
    current_date = from
    while current_date <= to
      dates.push(current_date)
      current_date = (current_date + 1.months).beginning_of_month
    end
    return dates
  end

  def range_time_by_year
    dates = []
    current_date = from
    while current_date <= to
      dates.push(current_date)
      current_date = (current_date + 1.years).beginning_of_year
    end
    return dates
  end
end
