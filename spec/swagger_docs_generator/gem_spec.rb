# frozen_string_literal: true

require 'spec_helper'

describe SwaggerDocsGenerator, type: :gem,
                               name: :constant do
  it 'has a gem name' do
    expect(SwaggerDocsGenerator::GEM).not_to be nil
  end

  it 'has a version number' do
    expect(SwaggerDocsGenerator::VERSION).not_to be nil
  end

  it 'has a author' do
    expect(SwaggerDocsGenerator::AUTHORS).not_to be nil
  end

  it 'has a email' do
    expect(SwaggerDocsGenerator::EMAILS).not_to be nil
  end

  it 'has a summary' do
    expect(SwaggerDocsGenerator::SUMMARY).not_to be nil
  end

  it 'has a dscription' do
    expect(SwaggerDocsGenerator::DESCRIPTION).not_to be nil
  end

  it 'has a homepage' do
    expect(SwaggerDocsGenerator::HOMEPAGE).not_to be nil
  end

  it 'has a license' do
    expect(SwaggerDocsGenerator::LICENSE).not_to be nil
  end
end
