# frozen_string_literal: true

module SwaggerDocsGenerator
  class ConfigurationPath
    def initialize
    end
  end

  class << self
    def configure_path
      block_given? ? yield(config_path) : config_path
    end

    def config_path
      @config ||= ConfigurationPath.new
    end
  end
end
