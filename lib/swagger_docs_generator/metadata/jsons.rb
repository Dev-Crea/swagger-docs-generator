# frozen_string_literal: true

require 'swagger_docs_generator/metadata/sort'

module SwaggerDocsGenerator
  # Parse temporary json files
  class MetadataJsons
    def initialize
      @paths = { paths: {} }
      @tags_array = []
    end

    def construct_swagger_file
      hash = {}
      files_tmp.each do |file|
        @paths[:paths].merge!(read_part_json(file, 'paths'))
        @tags_array.push read_part_json(file, 'tags')
      end
      hash.merge(Sort.new(@paths).sort_by_tag).merge(tags: @tags_array)
    end

    private

    # :reek:UtilityFunction
    def files_tmp
      Dir[Rails.root.join(SwaggerDocsGenerator.temporary_folder, '*.json')]
    end

    # :reek:UtilityFunction
    def read_part_json(file, key)
      JSON.parse(File.read(file))[key]
    end
  end
end
