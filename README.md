# Swagger::Docs::Generator | [![Travis][1]][2] [![Gem][21]][22] [![Docs][11]][12]

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
bundle
```

Or install it yourself as :

```linux
gem install swagger_docs_generator
```

### Usage

Create initializer :

```linux
rails generator swagger_docs_generator:initializer
```

Create environment :

```linux
rails generator swagger_docs_generator:environment
```

Execute rake task for generated `swagger.json` :

```linux
rake swagger:docs
```


## Examples

```ruby
# frozen_string_literal: true

module V1
  # Documentation API for AddressesController
  class AddressesDoc < BaseDoc
    CONTROLLER = V1::Geos::AddressesController

    # Describe object Addresses
    # ###
    scontroller 'User Addresses management'

    # Describe all actions
    # ###
    sdoc :show do
      summary 'Show address'
      responses do
        status 200
        schema { definition 'address' }
      end
      responses { status 404 }
      responses { status 422 }
      description <<EOS
  # Show address to user

  Show complete address to user.
EOS
    end

    sdoc :create do
      summary 'Create address'
      responses { status 201 }
      responses { status 422 }
      parameters do
        body do
          name 'address'
          schema 'address create'
        end
      end
      description <<EOS
  # Add address

  Save an address to user.
EOS
    end

    sdoc :update do
      summary 'Update address'
      responses do
        status 200
        schema { definition 'address' }
      end
      responses { status 404 }
      responses { status 422 }
    end

    sdoc :destroy do
      summary 'Destroy address'
      responses do
        status 200
        schema { definition 'address' }
      end
      responses { status 404 }
      responses { status 422 }
    end

    # Add definition more model
    # ###
    sdefinition 'address create' do
      required %w[address]
      properties do
        required %w{country city zip_code street}
        properties country: { type: :string },
                   city: { type: :string },
                   zip_code: { type: :string },
                   street: { type: :string },
                   complements: { type: :string }
      end
    end

    sdefinition 'address' do
      required %w[address]
      properties do
        properties country: { type: :string },
                   city: { type: :string },
                   zip_code: { type: :string },
                   street: { type: :string },
                   complements: { type: :string },
                   coordinates: { type: :string }
      end
    end
  end
end
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
<https://github.com/Dev-Crea/swagger-docs-generator>. This project is intended to
be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org)
code of conduct.

[1]: https://travis-ci.org/Dev-Crea/swagger-docs-generator.svg?branch=master
[2]: https://travis-ci.org/Dev-Crea/swagger-docs-generator

[11]: https://badge.fury.io/rb/swagger_docs_generator.svg
[12]: https://badge.fury.io/rb/swagger_docs_generator

[21]: https://inch-ci.org/github/Dev-Crea/swagger-docs-generator.svg
[22]: https://inch-ci.org/github/Dev-Crea/swagger-docs-generator
