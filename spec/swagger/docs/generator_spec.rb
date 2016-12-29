# frozen_string_literal: true

require 'spec_helper'

describe Swagger::Docs::Generator::Generator, type: :generator do
  before(:context) { Swagger::Docs::Generator::Generator.new }
  # Test file is created
  it { expect('public/swagger.json').to be_an_existing_file }

  # Test file complete
end
