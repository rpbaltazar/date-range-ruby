module Jiff
  module MonthMapper
    DAYS_MONTH = {
      1 => 31,
      2 => nil,
      3 => 31,
      4 => 30,
      5 => 31,
      6 => 30,
      7 => 31,
      8 => 31,
      9 => 30,
      10 => 31,
      11 => 30,
      12 => 31
    }.freeze

    def self.days_in_month(month, leap = false)
      return DAYS_MONTH[month] unless month == 2
      return 29 if leap

      28
    end
  end
end
