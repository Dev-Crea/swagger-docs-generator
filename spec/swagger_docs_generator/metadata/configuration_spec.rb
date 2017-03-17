# frozen_string_literal: true

require 'spec_helper'

describe SwaggerDocsGenerator::MetadataConfiguration, type: :metadata,
                                                      name: :configuration do
  let(:metadata) { SwaggerDocsGenerator::MetadataConfiguration.new }

  include_examples 'configuration metadata is', :swagger
  include_examples 'configuration metadata is', :base_path
  include_examples 'configuration metadata is', :schemes
  include_examples 'configuration metadata is', :host
  include_examples 'configuration metadata is', :definitions
  include_examples 'configuration metadata is', :external_docs
  include_examples 'configuration metadata is', :security
end
