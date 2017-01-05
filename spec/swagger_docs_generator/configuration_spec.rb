# frozen_string_literal: true

require 'spec_helper'
require 'support/examples/configuration'

describe SwaggerDocsGenerator::Configuration, type: :gem,
                                              name: :configuration do
  specify do
    expect { |config| SwaggerDocsGenerator.configure(&config) }.to yield_control
  end

  let(:conf) { SwaggerDocsGenerator.configure }
  let(:variable) { conf.swagger }
  it_behaves_like 'variable exist', 'swagger'
end

describe SwaggerDocsGenerator::ConfigurationInfo, type: :gem,
                                                  name: :configuration_info do
  let(:conf) { SwaggerDocsGenerator.configure_info }
  let(:variable) { conf.title }
  it_behaves_like 'variable exist', 'title'
  let(:variable) { conf.version }
  it_behaves_like 'variable exist', 'version'
end
