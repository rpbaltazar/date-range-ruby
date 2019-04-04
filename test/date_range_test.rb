require 'test_helper'

class DateRangeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::DateRange::VERSION
  end

  def test_to_a
    d1 = Date.parse('27/02/2019')
    d2 = Date.parse('03/03/2019')
    date_range = DateRange.new(d1, d2)
    expected_dates = [Date.parse('27/02/2019'), Date.parse('28/02/2019'),
                      Date.parse('01/03/2019'), Date.parse('02/03/2019'),
                      Date.parse('03/03/2019')]
    assert_equal(date_range.to_a, expected_dates)
  end
end
