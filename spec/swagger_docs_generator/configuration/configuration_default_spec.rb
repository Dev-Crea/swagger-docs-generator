# frozen_string_literal: true

require 'spec_helper'

describe SwaggerDocsGenerator::Configuration, type: :gem,
                                              name: :configuration do
  describe 'with value default' do
    context 'swagger' do
      let(:variable) { SwaggerDocsGenerator.config.swagger }
      it_behaves_like 'variable exist', '2.0'
    end

    context 'cleanning' do
      let(:variable) { SwaggerDocsGenerator.config.cleanning }
      it_behaves_like 'variable exist', true
    end

    context 'base_controller' do
      let(:variable) { SwaggerDocsGenerator.config.base_controller }
      it_behaves_like 'variable exist', ''
    end

    context 'base_path' do
      let(:variable) { SwaggerDocsGenerator.config.base_path }
      it_behaves_like 'variable exist', '/'
    end

    context 'schemes' do
      let(:variable) { SwaggerDocsGenerator.config.schemes }
      it_behaves_like 'variable does not exist'
    end

    context 'consumes' do
      let(:variable) { SwaggerDocsGenerator.config.consumes }
      it_behaves_like 'variable does not exist'
    end

    context 'produces' do
      let(:variable) { SwaggerDocsGenerator.config.produces }
      it_behaves_like 'variable does not exist'
    end

    context 'host' do
      let(:variable) { SwaggerDocsGenerator.config.host }
      it_behaves_like 'variable does not exist'
    end
  end
end
