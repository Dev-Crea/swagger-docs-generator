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
      @file = 'swagger.json'
      @swagger_file = File.join(Dir.pwd, 'public', @file)
      @temp = FileUtils.mkdir_p(SwaggerDocsGenerator.temporary_folder)
    end

    # Import documentation file
    def import_documentations
      require SwaggerDocsGenerator.file_base
      SwaggerDocsGenerator.file_docs.each { |rb| require rb }
    end

    # Open or create a swagger.json file
    def generate_swagger_file
      delete_file_before
      File.open(@swagger_file, 'a+') do |file|
        file.puts = if SwaggerDocsGenerator.configure.compress
                      write_in_swagger_file.to_json
                    else
                      JSON.pretty_generate write_in_swagger_file
                    end
      end
    end

    # Delete files temporary
    def delete_temporary_files
      FileUtils.rm_rf(@temp[0]) if SwaggerDocsGenerator.configure.cleanning
    end

    # Create string with info to swagger file path
    def info_swagger_file
      "#{prefix_info} #{@swagger_file}"
    end

    # Create string with info to path temporary file
    def info_swagger_temporary
      "#{prefix_info} #{SwaggerDocsGenerator.temporary_folder}"
    end

    # Create string with controller parsed
    def info_controller_parser
      klasses = "#{SwaggerDocsGenerator.version_ruby}::BaseDoc".constantize
      klasses.subclasses.each do |controller|
        yield("#{prefix_info} [Controller] #{controller::CONTROLLER}")
      end
    end

    private

    attr_reader :meta

    def prefix_info
      '->'
    end

    def delete_file_before
      File.delete(@swagger_file) if File.exist?(@swagger_file)
    end

    # :reek:UtilityFunction
    def write_in_swagger_file
      # Parse option to this gem
      hash = MetadataConfiguration.new.construct_swagger_file
      hash.merge!(MetadataInfo.new.construct_swagger_file)
      # Parse temporary file (controller - actions)
      hash.merge!(MetadataJsons.new.construct_swagger_file)
      # Parse Model
      hash.merge!(MetadataDefinition.new.construct_swagger_file)
    end
  end
end
