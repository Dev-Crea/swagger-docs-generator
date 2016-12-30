# frozen_string_literal: true

RSpec.shared_examples 'method' do |result|
  it "return #{result}" do
    expect(method).to eql(result)
  end
end
