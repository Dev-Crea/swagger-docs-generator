# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'swagger/docs/generator'

RSpec.configure do |config|
  # Configure RSpec
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Exclude request with tag broken
  config.filter_run_excluding broken: true

  # Customize rspec
  config.color = true
end
