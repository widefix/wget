# Wget

Download files from the internet with ease. It's a wrapper around the standard Ruby `net/http` library. Large files are downloaded in chunks to avoid memory issues.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wget'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wget

## Usage

Use the `Wget.call` method to download a file from the internet. The method takes two arguments: the URL of the file to download and the filename to save the file as. The method will download the file and save it with the specified filename.

Refer to the example below:

```ruby
filename = "test.md"
url = "https://raw.githubusercontent.com/widefix/actual_db_schema/refs/heads/main/README.md"
Wget.call(url, filename)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wget. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Wget project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wget/blob/master/CODE_OF_CONDUCT.md).
