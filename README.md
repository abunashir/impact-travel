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

## Mount

Once you have successfully installed the underlying dependencies then you can
mount the engine simply by editing your `config/routes.rb`

```ruby
Rails.application.routes.draw do
  mount ImpactTravel::Engine => "/[PATH_YOU_WANNA_MOUNT_IT_TO]"
end
```

## Configure

Once you have mounted the engine then it expects you to configure it properly,
like setting up the `domain`, `logo`, `title`, `phone` to customizing it's
internal behavior with underlying dependencies. You can provide these as a
configuration by simply adding an initializer file in your application.

```ruby
ImpactTravel.configure do |config|
  config.api_key = "DISOUNT_NETWORK_API_KEY"
  config.logo = "logo-name.png"
  config.logo_inverse = "logo-inverse.png"

  # Application attributes
  config.domain = "example.com"
  config.title = "Application Name / Title"
  config.abbreviation = "Application abbreviation"
  config.phone = "Contact Number for the app"
  config.country = "The Country"
  config.address = "Company registered address"
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

## Override Layouts

By default, the engine ships with some predefined `layouts` that supports basic
customization but if you wanna provide your own `layouts` for login, landing,
loading or application page then all you need to do is add those layouts under
the `impact_travel` namespace. They layout it supports are

- Login - `app/views/layouts/impact_travel/login.html.erb`
- Landing - `app/views/layouts/impact_travel/landing.html.erb`
- Loading - `app/views/layouts/impact_travel/loading.html.erb`
- Application - `app/views/layouts/impact_travel/application.html.erb`

## Override Terms

By default, it ships with the standard terms and conditions that is apply to all
of the white label, but if you wanna add some customize terms then you can add
those under each page of `impact_travel` namespace.

One important thing, you can add the `show.html.erb` template here to override
the existing design and content, but if you only want to change the content then
we have extracted those behavior, all you need to do is add a `_content.html.erb`
and our engine will automatically grab the content from your partial but keep the
existing design unaffected. The resources that support `content` are

- Terms - `app/views/impact_travel/terms/_content.html.erb`
- Refunds - `app/views/impact_travel/refunds/_content.html.erb`
- Policies - `app/views/impact_travel/policies/_content.html.erb`
- Privacies - `app/views/impact_travel/privacies/_content.html.erb`
- Price Guarantee - `app/views/impact_travel/price_guarantees/_content.html.erb`
- Reservation - `app/views/impact_travel/reservation_guarantees/_content.html.erb`

## Development

We are following Sandi Metz's Rules for this application, you can read the
[description of the rules here][sandi-metz]. All new code should follow these
rules. If you make changes in a pre-existing file that violates these rules you
should fix the violations as part of your contribution.

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

## Credits

<img src="https://www.impactservices.io/images/logo-impact-services.png" width="266" alt="Impact Services Co. Ltd.">

This application is developed, maintained and funded by [Impact Services Co.
Ltd.][impactservices]

Thank you to all [the contributors][contributors].

[issues]: https://github.com/abunashir/impact-travel/issues
[squash]: https://github.com/thoughtbot/guides/tree/master/protocol/git#write-a-feature
[sandi-metz]: http://robots.thoughtbot.com/post/50655960596/sandi-metz-rules-for-developers
[contributors]: https://github.com/abunashir/impact-travel/graphs/contributors
[impactservices]: https://www.impactservices.co.th
