# frozen_string_literal: true

require 'spec_helper'

describe SwaggerDocsGenerator::MetadataInfo, type: :metadata,
                                             name: :info do
  let(:metadata) { SwaggerDocsGenerator::MetadataInfo.new }

  include_examples 'configuration metadata is', :title
  include_examples 'configuration metadata is', :version
  include_examples 'configuration metadata is', :description
  include_examples 'configuration metadata is', :terms_of_service
  include_examples 'configuration metadata is', :contact
  include_examples 'configuration metadata is', :license
end
