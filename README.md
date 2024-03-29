# Enveloop

enveloop-ruby is a ruby wrapper for the Enveloop API. It allows easy use of the API to send messages.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enveloop'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install enveloop

## Usage

### Ruby (direct usage)

Setup the client connection:

```ruby
require 'enveloop'

enveloop = Enveloop::Client.new(api_key: ENV['ENVELOOP_API_TOKEN'])
```

Send a message using a template:

```ruby
enveloop.send_message(
  template: 'welcome-email',
  to: 'user@email.com',
  from: 'welcome@myapp.com',
  subject: 'Welcome to MyApp',
  template_variables: {
    first_name: 'John',
  }
)
```

Send a message passing HTML body:

```ruby
enveloop.send_message(
  html: '<h1>Hello John, Welcome to MyApp</h1>',
  to: 'user@email.com',
  from: 'welcome@myapp.com',
  subject: 'Welcome to MyApp',
)
```

Get information about a template (variables and body html):

```ruby
enveloop.template_info(template: 'welcome-email')
```
### Rails

Add the following to your initializer and send Active::Mailer messaegs with Enveloop as well

```ruby
config.action_mailer.delivery_method = :enveloop
config.action_mailer.enveloop_settings = { 
  api_key: ENV['ENVELOOP_API_TOKEN']
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/enveloophq/enveloop-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/enveloophq/enveloop-ruby/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Enveloop project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/enveloophq/enveloop-ruby/blob/master/CODE_OF_CONDUCT.md).
