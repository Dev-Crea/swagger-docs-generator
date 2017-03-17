# frozen_string_literal: true

require 'spec_helper'

describe SwaggerDocsGenerator::Configuration, type: :gem,
                                              broken: true,
                                              name: :configuration do
  before(:example) do
    SwaggerDocsGenerator.configure do |config|
      config.schemes = ['http']
      config.consumes = 'application/vnd.github.v3.full+json'
      config.produces = 'application/vnd.github+json'
      config.host = 'http://example.com'
      config.swagger = '2.2.4'
      config.cleanning = false
      config.base_controller = []
    end
  end

  describe 'with customize value' do
    context 'swagger' do
      let(:variable) { SwaggerDocsGenerator.config.swagger }
      it_behaves_like 'variable exist', '2.2.4'
    end

    context 'cleanning' do
      let(:variable) { SwaggerDocsGenerator.config.cleanning }
      it_behaves_like 'variable exist', false
    end

    context 'base_controller' do
      let(:variable) { SwaggerDocsGenerator.config.base_controller }
      it_behaves_like 'variable exist', []
    end

    context 'base_path' do
      let(:variable) { SwaggerDocsGenerator.config.base_path }
      it_behaves_like 'variable exist', '/'
    end

    context 'schemes' do
      let(:variable) { SwaggerDocsGenerator.config.schemes }
      it_behaves_like 'variable exist', ['http']
    end

    context 'consumes' do
      let(:variable) { SwaggerDocsGenerator.config.consumes }
      it_behaves_like 'variable exist', 'application/vnd.github.v3.full+json'
    end

    context 'produces' do
      let(:variable) { SwaggerDocsGenerator.config.produces }
      it_behaves_like 'variable exist', 'application/vnd.github+json'
    end

    context 'host' do
      let(:variable) { SwaggerDocsGenerator.config.host }
      it_behaves_like 'variable exist', 'http://example.com'
    end
  end
end
