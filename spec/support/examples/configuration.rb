# frozen_string_literal: true

RSpec.shared_examples 'variable exist' do |name|
  it name do
    expect(variable).not_to be nil
  end
end
