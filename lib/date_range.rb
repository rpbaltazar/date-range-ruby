require "date_range/version"

class DateRange
  attr_reader :start_date
  attr_reader :end_date

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end
end
