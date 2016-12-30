# frozen_string_literal: true

require 'spec_helper'
require 'support/examples/configuration'

describe SwaggerDocsGenerator::Configuration, type: :gem,
                                              name: :configuration do
  specify do
    expect { |config| SwaggerDocsGenerator.configure(&config) }.to yield_control
  end

  let(:conf) { SwaggerDocsGenerator.configure }
  let(:variable) { conf.version_swagger }
  it_behaves_like 'variable exist', 'version_swagger'
  it_behaves_like 'variable exist', 'version_api'
  it_behaves_like 'variable exist', 'attribute'
  it_behaves_like 'variable exist', 'base_path'

  let(:swag) { SwaggerDocsGenerator::Configuration }
  it { expect(swag::VERSION_SWAGGER).to eql('1.0.4') }
  it { expect(swag::VERSION_API).to eql('1.0.0') }
  it { expect(swag::BASE_PATH).to eql('localhost:3000') }
  it { expect(swag::ATTRIBUTE).to eql(title: 'Title Example API') }
end
