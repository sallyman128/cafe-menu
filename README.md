# TodaysWeather

The TodaysWeather gem provides users with live weather information for their desired location in the U.S.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'todays_weather'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install todays_weather

## Usage

To use this gem, you will need to generate a personal API key from Open Weather <https://openweathermap.org/price>

The gem will prompt the user to select their preferred unit of measurement for temperature and a 5-digit zipcode in the U.S. Using both pieces of information, the gem will pull the desired data from the OpenWeather API and output it to the user.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sallyman128/todays-weather. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/sallyman128/todays-weather/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TodaysWeather project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sallyman128/todays-weather/blob/master/CODE_OF_CONDUCT.md).
# todays-weather
