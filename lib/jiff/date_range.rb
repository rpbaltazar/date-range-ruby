require 'date'

require_relative 'date_range/version'
require_relative 'month_mapper'

module Jiff
  # Implementation of date range relying in ruby dates (no rails helpers/add-ons)
  class DateRange
    attr_reader :start_date
    attr_reader :end_date

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
    end

    def by_month
      return month_ends_in_range if date_is_end_of_month(start_date)

      dates = []
      current_date = start_date
      while current_date <= end_date
        dates << current_date
        current_date = next_date(current_date, dates)
      end
      dates
    end

    def to_a
      date_range.to_a
    end

    def include?(date)
      if date.is_a?(Jiff::DateRange)
        include?(date.start_date) || include?(date.end_date)
      else
        date >= start_date && date <= end_date
      end
    end

    def overlap?(other_range)
      # TODO: Probably should raise 'unsupported type'
      return unless other_range.is_a? Jiff::DateRange

      other_range.include?(start_date) || other_range.include?(end_date) || include?(other_range)
    end

    # NOTE: Thank you @chrismytton for the implementation suggestion
    def overlap(other_range)
      return unless overlap?(other_range)

      dates = [start_date, end_date, other_range.start_date, other_range.end_date].sort[1, 2]
      Jiff::DateRange.new(*dates)
    end

    private

    def days_grouped_by_month
      to_a.group_by { |date| "#{date.month}-#{date.year}" }
    end

    def month_ends_in_range
      dates = days_grouped_by_month.values.map(&:last)
      dates.pop unless date_is_end_of_month(end_date)
      dates
    end

    def next_date(current_date, dates)
      # NOTE: If first date is in february, then there is no problem
      # in jumping forward.
      if current_date.month == 2 && dates.length > 1
        dates[-2] >> 2
      else
        current_date >> 1
      end
    end

    def date_range
      (start_date..end_date)
    end

    def date_is_end_of_month(date)
      date.day == MonthMapper.days_in_month(date)
    end
  end
end
