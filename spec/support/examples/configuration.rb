# frozen_string_literal: true

RSpec.shared_examples 'variable exist' do |default|
  it { expect(variable).to eql(default) }
end

RSpec.shared_examples 'variable does not exist' do
  it { expect(variable).to be nil }
end
