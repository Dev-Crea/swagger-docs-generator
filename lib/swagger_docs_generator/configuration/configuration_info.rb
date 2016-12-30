# frozen_string_literal: true

# :reek:Attribute
module SwaggerDocsGenerator
  # # Information element
  #
  # Create a Hash element for information to API doc.
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#info-object
  class ConfigurationInfo
    attr_accessor :title, :description, :terms_of_service, :contact, :license,
                  :version

    TITLE = 'Title Example API'
    VERSION = '1.0.0'

    # Initialize required element
    def initialize
      @title = TITLE
      @version = VERSION
    end
  end

  class << self
    def configure_info
      block_given? ? yield(info) : info
    end

    def info
      @info ||= ConfigurationInfo.new
    end
  end
end
