# Changelog

> ## Version 0.1.0
> Initial Release.

* Adds support for sending emails

> ## Version 0.1.1

* Add Response class

> ## Version 0.1.2

* add `template_info` to fetch the template body and see waht variables are defined on a template

> ## Version 0.1.3

* change `user_variables` to `template_variables` in API call

> ## Version 0.1.4

* Do not require `from` in api call to allow for default from in template
* Do not require `subject` in api call to allow for default subject in template
* send `Sdk-Version` header for tracking of SDK usage and future deprection warnings

> ## Version 0.1.5

* Use new `/messages` endpoint

> ## Version 0.1.6

* Raise ruby errors when an error is encountered in the API

> ## Version 0.2.0

* Add support for Rails via ActiveMailer
* Add `send_raw` method to send HTML email without a template