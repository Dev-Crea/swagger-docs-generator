# frozen_string_literal: true

require 'spec_helper'

describe Swagger::Docs::Generator::Configuration, type: :configuration do
  specify do
    expect do |config|
      Swagger::Docs::Generator.configure(&config)
    end.to yield_control
  end
end
