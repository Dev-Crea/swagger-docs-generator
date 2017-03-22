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

    # Initialize required element
    def initialize
      @title = 'Title Example API'
      @version = '1.0.0'
    end
  end

  class << self
    def configure_info
      block_given? ? yield(info) : info
    end

    def info
      @info ||= ConfigurationInfo.new
    end

    def version_ruby
      @info.version.humanize
    end
  end
end
