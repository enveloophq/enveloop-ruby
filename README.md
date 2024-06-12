# Enveloop Ruby
`enveloop-ruby` is a Ruby wrapper for the [Enveloop](https://enveloop.com) API. It simplifies configuring and sending messages (email & SMS/text) via Enveloop inside your Ruby and Ruby on Rails apps.

## Installation
There are a couple of ways to get started. Using [RubyGems](https://rubygems.org/), you can install it locally with the following command:
```console
$ gem install enveloop
```

Additionally, you can add the following to your application's Gemfile:
```ruby
gem 'enveloop'
```

After doing so, you can run the following terminal command:
```console
$ bundle install
```

## Using the Enveloop Gem
The Enveloop Gem includes helpful methods to interact with the Enveloop API, including:
* `send_message`
* `send_raw`
* `template_info`

We'll talk about how to use some of these methods in the notes to follow. 

### Ruby (direct usage)

First, let's set up a connection. You'll need to require the `enveloop` gem, define a client, and add in your Enveloop API token. Your API token is located in the **Settings** for each project you have on [Enveloop](https://app.enveloop.com).

```ruby
require 'enveloop'

enveloop = Enveloop::Client.new(api_key:`ENVELOOP_API_TOKEN')
```

Now that your connection is established, let's use a method to send a message.

_(Note: This method call assumes that you have created a basic template in Enveloop and provides an example of a template variable you may use. Please alter according to how you have set up your template.)_


#### Send an email message using an Enveloop template:

```ruby
enveloop.send_message(
  template: 'welcome-email',
  to: 'user@email.com',
  from: 'welcome@myapp.com',
  subject: 'Welcome to My App!',
  template_variables: {
    first_name: 'John',
  }
)
```

If you want to send a message, via Enveloop, and not use an Enveloop template, you can remove the `template` argument from the method and include the `html` argument instead -- it takes a custom HTML body and creates a structured email message to send out.

#### Send an email message passing custom HTML

```ruby
enveloop.send_message(
  html: '<h1>Hello John, Welcome to MyApp</h1>',
  to: 'user@email.com',
  from: 'welcome@myapp.com',
  subject: 'Welcome to MyApp',
)
```

#### Send a text/SMS message
```ruby
enveloop.send_message(
   template: 'registration-complete',
   to: '+14155551212',
   from: '+12056113369',
   template_variables: {
      first_name: 'Paul'
   }
)
```

_(As you can see, the structure of the `send_message` method is similar, but we simply swap out an email address for a mobile number. Also, the template used is an SMS template on the Enveloop platform.)_

#### Get information about a template (variables and body HTML):

```ruby
enveloop.template_info(template: 'welcome-email')
```

### Ruby on Rails
Using Enveloop with Ruby on Rails is easy as well. Here is a recommended approach for getting it set up in your Rails application.

#### Update your initializer
Add/update the following lines in your respective Rails environments file.

```ruby
unless Rails.env.production?
  ENV['ENVELOOP_API_KEY'] = 'ENVELOOP_API_KEY'
end

config.action_mailer.delivery_method = :enveloop
config.action_mailer.enveloop_settings = { 
  api_key: ENV['ENVELOOP_API_TOKEN']
}
```




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
