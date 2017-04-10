# frozen_string_literal: true

require 'spec_helper'
require 'rake'

describe 'SwaggerDocsGenerator::Rake::Docs', type: :rake,
                                             name: :swagger_docs,
                                             broken: true do
  before do
    path = File.expand_path('../../../../lib/tasks', __FILE__)
    puts "FILES : #{path}"
    Rake.application.rake_require("#{path}/swagger")
  end

  it 'Invoke task rake swagger:docs' do
    Rake.application['swagger::docs'].invoke
  end
end
