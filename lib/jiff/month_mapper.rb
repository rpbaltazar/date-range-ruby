module Jiff
  # Simple mapper between month and number of days
  module MonthMapper
    DAYS_MONTH = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31].freeze

    def self.days_in_month(date)
      month = date.month
      return 29 if month == 2 && Date.gregorian_leap?(date.year)

      DAYS_MONTH[month - 1]
    end
  end
end
