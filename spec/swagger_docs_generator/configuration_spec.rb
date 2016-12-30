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
  let(:variable) { conf.info }
  it_behaves_like 'variable exist', 'info'
end

describe SwaggerDocsGenerator::ConfigurationInfo, type: :gem,
                                                  name: :configuration_info do
  let(:conf) { SwaggerDocsGenerator.configure }
  let(:variable) { conf.info.title }
  it_behaves_like 'variable exist', 'title'
  let(:variable) { conf.info.version }
  it_behaves_like 'variable exist', 'version'
end
