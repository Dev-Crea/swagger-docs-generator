# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Parse Readme information
  #
  # Parse block code for display basic information for this API Doc
  class ParserReadme < Parser
    def initialize(readme_file)
      @tag_name = 'README'
      @readme = readme_file
      create_file
    end

    def adding_readme
      json = JSON.parse(File.read(temporary_file))
      File.open(temporary_file, 'w') do |file|
        json['paths'].merge!(complete_path)
        json['tags'].merge!(complete_tag)
        file.puts(JSON.pretty_generate(json))
      end
    end

    private

    def complete_path
      {
        @tag_name => {
          get: {
            summary: 'Introduction',
            description: @readme,
            tags: [@tag_name]
          }
        }
      }
    end

    def complete_tag
      {
        name: @tag_name,
        description: 'Display basic information to this API documentation'
      }
    end

    def create_file
      File.delete(temporary_file) if File.exist?(temporary_file)
      base_file = { paths: {}, tags: {}, definitions: {} }
      File.open(temporary_file, 'a+') { |file| file.puts(base_file.to_json) }
    end
  end
end
