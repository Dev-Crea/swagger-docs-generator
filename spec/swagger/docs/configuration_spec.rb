# frozen_string_literal: true

require 'spec_helper'

describe Swagger::Docs::Generator::Configuration, type: :configuration do
  require 'fixtures/controllers/application_controller'

  it 'should confirm a block is passed' do
    expect(String).to receive(:bar) { |&block| expect(block).to be_a(Proc) }
  end
end
