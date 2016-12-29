# frozen_string_literal: true

require 'spec_helper'

describe Swagger::Docs::Generator, type: :gem,
                                   name: :constant do
  it 'has a gem name' do
    expect(Swagger::Docs::Generator::GEM).not_to be nil
  end

  it 'has a version number' do
    expect(Swagger::Docs::Generator::VERSION).not_to be nil
  end

  it 'has a author' do
    expect(Swagger::Docs::Generator::AUTHORS).not_to be nil
  end

  it 'has a email' do
    expect(Swagger::Docs::Generator::EMAILS).not_to be nil
  end

  it 'has a summary' do
    expect(Swagger::Docs::Generator::SUMMARY).not_to be nil
  end

  it 'has a dscription' do
    expect(Swagger::Docs::Generator::DESCRIPTION).not_to be nil
  end

  it 'has a homepage' do
    expect(Swagger::Docs::Generator::HOMEPAGE).not_to be nil
  end

  it 'has a license' do
    expect(Swagger::Docs::Generator::LICENSE).not_to be nil
  end
end
