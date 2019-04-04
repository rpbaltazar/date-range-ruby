require 'date'

require_relative 'date_range/version'
require_relative 'month_mapper'

module Jiff
  class DateRange
    attr_reader :start_date
    attr_reader :end_date

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
    end

    def by_month
      return month_ends_in_range if date_is_end_of_month(@start_date)

      dates = []
      current_date = @start_date
      while current_date <= @end_date
        dates << current_date
        current_date = next_date(current_date, dates)
      end
      dates
    end

    def to_a
      date_range.to_a
    end

    private

    def days_grouped_by_month
      to_a.group_by { |date| "#{date.month}-#{date.year}" }
    end

    def month_ends_in_range
      dates = days_grouped_by_month.values.map(&:last)
      dates.pop unless date_is_end_of_month(@end_date)
      dates
    end

    def next_date(current_date, dates)
      if current_date.month == 2
        dates[-2] >> 2
      else
        current_date >> 1
      end
    end

    def date_range
      (@start_date..@end_date)
    end

    def date_is_end_of_month(date)
      date.day == MonthMapper.days_in_month(date.month)
    end
  end
end
