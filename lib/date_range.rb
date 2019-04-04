require "date_range/version"
require 'date'

class DateRange
  attr_reader :start_date
  attr_reader :end_date

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def to_a
    date_range.to_a
  end

  private

  def date_range
    (@start_date..@end_date)
  end
end
