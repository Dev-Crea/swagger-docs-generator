# frozen_string_literal: true

require 'spec_helper'

describe Swagger::Docs::Generator::Generator, type: :aruba,
                                              name: :generator do
  before(:context) do
    @swag = Swagger::Docs::Generator::Generator.new
    @swagger_file = @swag.swagger_file
  end

  context 'File exist' do
    before(:context) do
      @swag.generate_swagger_file
    end

    it { expect(File.exist?(@swagger_file)).to eql(true) }
    it { expect(@swagger_file).to match_json_schema(:swagger) }

    after(:context) { File.delete(@swagger_file) }
  end

  context "File doesn't exist" do
    it { expect(File.exist?(@swagger_file)).to eql(false) }
  end
end
