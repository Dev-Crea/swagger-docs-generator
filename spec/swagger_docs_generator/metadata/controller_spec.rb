# frozen_string_literal: true

require 'spec_helper'

describe SwaggerDocsGenerator::MetadataController, type: :metadata,
                                                   broken: true,
                                                   name: :configuration do
  let(:metadata) { SwaggerDocsGenerator::MetadataController.new }

  before(:context) do
    class ApplicationController < ::ApplicationController
    end
  end

  it { expect(metadata.send(:class_controller)).to be_kind_of Array }
  it { expect(metadata.send(:array_controller)).to be_kind_of Array }
  it { expect(metadata.send(:string_controller)).to be_kind_of String }
end
