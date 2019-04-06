# DateRange

This gem came up from the need of using date ranges in our reporting tool
and the lack of a gem that actually provided date ranges manipulations, such as
building arrays of dates.

Furthermore, the logic for date manipulation within a date range is not always
clear as we have leap years and months with 28/29/30/31 days.
Though Ruby provides date shifting with `date >> 1` (date + 1.month) or
`date << 1` (date - 1.month) there are edge cases that would break the date
range from my point of view.

For example (please note this is not valid ruby code but a pseudo example)

```
d1 = Date.parse('31/01/2019')
d2 = Date.parse('30/04/2019')

monthly_stepped = []
current_date = d1
while current_date <= d2
  monthly_stepped << current_date
  current_date = current_date >> 1
end
```
I would expect my `monthly_stepped` to have the following dates
`[2019-01-31, 2019-02-28, 2019-03-31, 2019-04-30]`
and instead the result of this is the following
`[2019-01-31, 2019-02-28, 2019-03-28, 2019-04-28]`

I don't necessarily think that the ruby implementation is wrong, it simply does
not apply to my needs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jiff-date_range'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jiff-date_range

## Usage

### Initialize a new date range

At the moment, this DateRange is expecting two dates to be passed in as argument
In the near future the ability to pass in other valid objects will most likely be
supported.

```ruby
d1 = Date.parse('27/02/2019')
d2 = Date.parse('03/03/2019')
date_range = Jiff::DateRange.new(d1, d2)
```

### by_month

This gives you the dates that fall within the date range in a monthly step. I
believe its easier if you see examples rather than describing them, so here they
are. Please note that the returning objects will be Date objects as well

```ruby
d1 = Date.parse('01/01/2019')
d2 = Date.parse('03/03/2019')
date_range = Jiff::DateRange.new(d1, d2)
date_range.by_month # => [01/01/2019, 01/02/2019, 01/03/2019]
```

```ruby
d1 = Date.parse('06/04/2019') - 60
d2 = Date.parse('06/04/2019')
date_range = Jiff::DateRange.new(d1, d2)
date_range.by_month # => [05/02/2019, 05/03/2019, 05/04/2019]
```

```ruby
d1 = Date.parse('30/01/2019')
d2 = Date.parse('03/04/2019')
date_range = Jiff::DateRange.new(d1, d2)
date_range.by_month # => [30/01/2019, 28/02/2019, 30/03/2019]
```

```ruby
d1 = Date.parse('31/01/2019')
d2 = Date.parse('29/04/2019')
date_range = Jiff::DateRange.new(d1, d2)
date_range.by_month # => [31/01/2019, 28/02/2019, 31/03/2019]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/rpbaltazar/jiff-date_range. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to adhere
to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
As you'll understand because this is used for a production use case, it might be
a bit opinionated, but I'm definitely open for discussion as this is
an open topic.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jiff::DateRange project’s codebases, issue trackers,
chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rpbaltazar/jiff-date_range/blob/master/CODE_OF_CONDUCT.md).
