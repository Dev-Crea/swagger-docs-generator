# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Generate JSON file
  #
  # Create a json file for swagger-ui service
  #
  # @!attribute [r] swagger_file
  #   @return [String] the swagger file name with path
  class Generator
    attr_reader :swagger_file

    def initialize
      @hash = {}
      @file = 'swagger.json'
      @swagger_file = File.join(path, @file)
      @version = File.join(path, SwaggerDocsGenerator.configure_info.version)
      create_version_folder
    end

    # Open or create a swagger.json file
    def generate_swagger_file
      delete_file_before
      File.open(@swagger_file, 'a+') { |file| file.puts agregate_metadata }
    end

    # Delete files temporary
    def delete_temporary_files
      FileUtils.remove_dir(@version) if SwaggerDocsGenerator.configure.cleanning
    end

    def info_swagger_file
      create_info_text(@swagger_file)
    end

    def info_swagger_temporary
      create_info_text(@version)
    end

    private

    attr_reader :meta

    def prefix_info
      '->'
    end

    def create_info_text(message)
      "#{prefix_info} #{message}"
    end

    # :reek:UtilityFunction
    def path
      File.join(Dir.pwd, '/public')
    end

    def delete_file_before
      File.delete(@swagger_file) if File.exist?(@swagger_file)
    end

    def create_version_folder
      FileUtils.mkdir_p(@version) unless File.directory?(@version)
    end

    def write_in_swagger_file
      write_in_swagger_file_configurations
      write_in_swagger_file_controllers
      write_in_swagger_file_models
    end

    def write_in_swagger_file_configurations
      @hash.merge!(MetadataConfiguration.new.construct_swagger_file)
      @hash.merge!(MetadataInfo.new.construct_swagger_file)
    end

    def write_in_swagger_file_controllers
      @hash.merge!(MetadataPath.new.construct_swagger_file)
      @hash.merge!(MetadataTag.new.construct_swagger_file)
    end

    def write_in_swagger_file_models
      @hash.merge!(MetadataDefinition.new.construct_swagger_file)
    end

    def agregate_metadata
      case defined?(Rails) && Rails.env
      when 'production' || 'test'
        write_in_swagger_file.to_json
      else
        JSON.pretty_generate write_in_swagger_file
      end
    end
  end
end
