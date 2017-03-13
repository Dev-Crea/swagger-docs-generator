# Swagger::Docs::Generator | [![Build Status](https://travis-ci.org/Dev-Crea/swagger-docs-generator.svg?branch=master)](https://travis-ci.org/Dev-Crea/swagger-docs-generator) [![Gem Version](https://badge.fury.io/rb/swagger_docs_generator.svg)](https://badge.fury.io/rb/swagger_docs_generator) [![Inline docs](https://inch-ci.org/github/Dev-Crea/swagger-docs-generator.svg)](https://inch-ci.org/github/Dev-Crea/swagger-docs-generator)

Generator for Swagger Apps ([Example with theme](https://github.com/Dev-Crea/swagger-ui))

## Menu

* [How to use](#how-to-use)
  * [Installation](#installation)
  * [Usage](#usage)
* [Development](#development)
* [Contributing](#contributing)


## How to use

### Installation

Add this line to your application's Gemfile :

```ruby
gem 'swagger-docs-generator'
```

And then execute :

```linux
$ bundle
```

Or install it yourself as :

```linux
$ gem install swagger-docs-generator
```

### Usage

Create initializer :

```linux
rails generator swagger_docs_generator:initializer
```

Execute rake task for generated `swagger.json` :

```linux
rake swagger:docs
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `rake spec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/Dev-Crea/swagger-docs-generator. This project is intended to
be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org)
code of conduct.
