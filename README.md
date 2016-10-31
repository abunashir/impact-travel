# Impact Travel

[![Build
Status](https://travis-ci.org/abunashir/impact-travel.svg?branch=master)](https://travis-ci.org/abunashir/impact-travel)
[![Code
Climate](https://codeclimate.com/github/impactservices/impact-travel/badges/gpa.svg)](https://codeclimate.com/github/impactservices/impact-travel)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "impact_travel", github: "abunashir/impact-travel"
```

And then execute:

```sh
$ bundle install
```

## Configure

Impact Travel Engine provides you an easier way to configure it's underlying
dependencies. Once you have the required credentials then you can add an
initializer to set up your configuration.

```ruby
ImpactTravel.configure do |config|
  config.api_key = "DISOUNT_NETWORK_API_KEY"
  config.logo = "logo-name.png"
  config.logo_inverse = "logo-inverse.png"

  # Application attributes
  config.title = "Application Name / Title"
  config.abbreviation = "Application abbreviation"
  config.phone = "Contact Number for the app"
  config.stylesheet = "custom.stylesheet"
  config.slides = ["slide-1.jpg", "slide-2.jpg"]

  # Search engine meta attributes
  config.keywords = "Keywords for meta attribute"
  config.description = "Description for meta attribute"
  config.author = "Author for meta attribute"

  # Social media pages
  config.facebook = "https://facebook.com/your-page"
  config.twitter = "https://twitter.com/your-page"
  config.instagram = "https://instagram.com/your-page"
end
```

## Development

We are following Sandi Metz's Rules for this application, you can read the
[description of the rules here]
(http://robots.thoughtbot.com/post/50655960596/sandi-metz-rules-for-developers). All new code should follow these rules. If you make changes in a pre-existing
file that violates these rules you should fix the violations as part of
your contribution.

### Setup

- Clone the repository.

```sh
% git clone git@github.com:abunashir/impact-travel.git
```

- Setup your environment.

```sh
% bin/setup
```

## Contributing

First, thank you for contributing! We love pull requests from everyone. By
participating in this project, you hereby grant to Impact Services Co Ltd with the
right to grant or transfer an unlimited number of non exclusive licenses or
sub-licenses to third parties, under the copyright covering the contribution to
use the contribution by all means .

Here are a few technical guidelines to follow:

1. Open an [issue][issues] to discuss a new feature.
1. Write tests to support your new feature.
1. Make sure the entire test suite passes locally and on CI.
1. Open a Pull Request.
1. [Squash your commits][squash] after receiving feedback.
1. Party!

[issues]: https://github.com/abunashir/impact-travel/issues
[squash]: https://github.com/thoughtbot/guides/tree/master/protocol/git#write-a-feature

## Credits

<img src="https://www.impactservices.io/images/logo-impact-services.png" width="266" alt="Impact Services Co. Ltd.">

This application is developed, maintained and funded by [Impact Services Co.
Ltd.] (https://www.impactservices.co.th)

Thank you to all [the contributors]
(https://github.com/abunashir/impact-travel/graphs/contributors)
