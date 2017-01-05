# frozen_string_literal: true

require 'spec_helper'
require 'support/examples/generator'

describe SwaggerDocsGenerator::Generator, type: :gem,
                                          name: :generator, broken: true do
  before(:context) do
    @swag = SwaggerDocsGenerator::Generator.new
    @swagger_file = @swag.swagger_file
  end

  context 'File exist' do
    before(:context) do
      @swag.generate_swagger_file
    end

    describe '#generate_swagger_file' do
      let(:method) { @swag.generate_swagger_file }
      it_behaves_like 'method', nil
    end

    it { expect(File.exist?(@swagger_file)).to eql(true) }
    it { expect(@swagger_file).to match_json_schema(:swagger) }

    after(:context) { File.delete(@swagger_file) }
  end

  context "File doesn't exist" do
    it { expect(File.exist?(@swagger_file)).to eql(false) }
  end
end
