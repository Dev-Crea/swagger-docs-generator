# frozen_string_literal: true

require 'spec_helper'

describe SwaggerDocsGenerator::Configuration, type: :gem,
                                              name: :configuration do
  specify do
    expect do |config|
      SwaggerDocsGenerator.configure(&config)
    end.to yield_control
  end
end
