require 'test_helper'

class Jiff::DateRangeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jiff::DateRange::VERSION
  end

  def test_to_a
    d1 = Date.parse('27/02/2019')
    d2 = Date.parse('03/03/2019')
    date_range = Jiff::DateRange.new(d1, d2)
    expected_dates = [Date.parse('27/02/2019'), Date.parse('28/02/2019'),
                      Date.parse('01/03/2019'), Date.parse('02/03/2019'),
                      Date.parse('03/03/2019')]
    assert_equal(expected_dates, date_range.to_a)
  end

  def test_by_month
    d1 = Date.parse('01/01/2019')
    d2 = Date.parse('03/03/2019')
    date_range = Jiff::DateRange.new(d1, d2)
    expected_dates = [Date.parse('01/01/2019'), Date.parse('01/02/2019'),
                      Date.parse('01/03/2019')]
    assert_equal(expected_dates, date_range.by_month)
  end

  def test_by_month_with_february_end_of_month
    d1 = Date.parse('30/01/2019')
    d2 = Date.parse('03/04/2019')
    date_range = Jiff::DateRange.new(d1, d2)
    expected_dates = [Date.parse('30/01/2019'), Date.parse('28/02/2019'),
                      Date.parse('30/03/2019')]
    assert_equal(expected_dates, date_range.by_month)
  end

  def test_by_month_with_end_of_month
    d1 = Date.parse('31/01/2019')
    d2 = Date.parse('29/04/2019')
    date_range = Jiff::DateRange.new(d1, d2)
    expected_dates = [Date.parse('31/01/2019'), Date.parse('28/02/2019'),
                      Date.parse('31/03/2019')]
    assert_equal(expected_dates, date_range.by_month)
  end

  def test_by_month_with_end_of_month_including_last_month
    d1 = Date.parse('31/01/2019')
    d2 = Date.parse('30/04/2019')
    date_range = Jiff::DateRange.new(d1, d2)
    expected_dates = [Date.parse('31/01/2019'), Date.parse('28/02/2019'),
                      Date.parse('31/03/2019'), Date.parse('30/04/2019')]
    assert_equal(expected_dates, date_range.by_month)
  end
end
