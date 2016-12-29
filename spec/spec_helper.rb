# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'swagger_docs_generator'

RSpec.configure do |config|
  # Configure RSpec
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Add libraries
  config.include Aruba::Api
  config.include JSON::SchemaMatchers

  # Configure JSON::SchemaMatchers
  Dir[File.join('spec/support/schemas/', '*.json')].count do |file|
    json_file = JSON.parse(File.read(file))
    json_name = File.basename(file, '.json').to_sym
    config.json_schemas[json_name] = json_file
  end

  # Exclude request with tag broken
  config.filter_run_excluding broken: true

  # Customize rspec
  config.color = true
end
