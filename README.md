# Impact Travel

[![Build
Status](https://travis-ci.org/impactservices/impact-travel.svg?branch=master)](https://travis-ci.org/impactservices/impact-travel)
[![Code
Climate](https://codeclimate.com/github/impactservices/impact-travel/badges/gpa.svg)](https://codeclimate.com/github/impactservices/impact-travel)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "impact-travel", github: "impactservices/impact-travel"
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
% git clone git@github.com:impactservices/impact-travel.git
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

[issues]: https://github.com/impactservices/impact-travel/issues
[squash]: https://github.com/thoughtbot/guides/tree/master/protocol/git#write-a-feature

## Credits

<img src="https://www.impactservices.io/images/logo-impact-services.png" width="266" alt="Impact Services Co. Ltd.">

This application is developed, maintained and funded by [Impact Services Co.
Ltd.] (https://www.impactservices.co.th)

Thank you to all [the contributors]
(https://github.com/impactservices/impact-travel/graphs/contributors)
