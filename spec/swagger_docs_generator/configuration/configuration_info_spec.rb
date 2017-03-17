# frozen_string_literal: true

require 'spec_helper'
require 'support/examples/configuration'

describe SwaggerDocsGenerator::ConfigurationInfo, type: :gem,
                                                  name: :configuration_info do
  describe 'with valie default' do
    context 'title' do
      let(:variable) { SwaggerDocsGenerator.info.title }
      it_behaves_like 'variable exist', 'Title Example API'
    end

    context 'version' do
      let(:variable) { SwaggerDocsGenerator.info.version }
      it_behaves_like 'variable exist', '1.0.0'
    end
  end
end
