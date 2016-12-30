# frozen_string_literal: true

# :reek:Attribute
module SwaggerDocsGenerator
  class ConfigurationInfo
    attr_accessor :title, :description, :termsOfService, :contact, :license,
                  :version

    TITLE = 'Title Example API'
    VERSION = '1.0.0'

    def initialize
      @title = TITLE
      @version = VERSION
    end
  end
end
