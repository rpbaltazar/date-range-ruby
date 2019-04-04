require "test_helper"

class DateRangeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::DateRange::VERSION
  end

  def test_to_a
    date_range = DateRange.new("")
  end
end
