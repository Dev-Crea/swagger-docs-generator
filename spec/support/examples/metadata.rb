# frozen_string_literal: true

RSpec.shared_examples 'configuration metadata is' do |method|
  key = method.to_s.camelize(:lower).to_sym

  include_examples 'metadata type is hash', method
  it { expect(metadata.send(method)).to include(key) }
end

RSpec.shared_examples 'metadata type is hash' do |method|
  it { expect(metadata.send(method)).to be_kind_of Hash }
end

RSpec.shared_examples 'metadata type is array' do |method|
  it { expect(metadata.send(method)).to be_kind_of Array }
end
