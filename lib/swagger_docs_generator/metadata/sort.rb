# frozen_string_literal: true

# :reek:FeatureEnvy

module SwaggerDocsGenerator
  # Sort routes in hash before writing in JSON file
  class Sort
    def initialize(hash)
      @routes = hash
      @readme = { README: @routes[:paths]['README'] }
    end

    # Sort routes by path
    def sort_by_path
      by_path = Hash[@routes[:paths].sort]
      place_readme_first(by_path)
    end

    # Sort routes by tags
    def sort_by_tag
      by_tag = Hash[@routes[:paths].sort_by do |_key, value|
        value.first[1]['tags']
      end]
      place_readme_first(by_tag)
    end

    private

    def place_readme_first(hash)
      if hash.key?('README')
        hash.delete('README')
        { paths: @readme.merge!(hash) }
      else
        { paths: hash }
      end
    end
  end
end
