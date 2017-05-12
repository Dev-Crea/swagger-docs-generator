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
      hash.merge(sort_paths).merge(tags: @tags_array)
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

    def sort_paths
      order = Sort.new(@paths)
      case SwaggerDocsGenerator.configure.sort
      when 'path' then order.sort_by_path
      when 'tag' then order.sort_by_tag
      else
        @paths
      end
    end
  end
end
