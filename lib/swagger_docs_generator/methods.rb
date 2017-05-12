# frozen_string_literal: true

# :reek:UtilityFunction
module SwaggerDocsGenerator
  # # Methods for controller
  #
  # Methods adding to controller parsing in rails appliation
  module Methods
    # Create json file for controller. Create all temporary file for each
    # controller.
    def swagger_controller(description)
      parse = ParserController.new(description)
      parse.adding_tag
    end

    # Complete json file with datas to method and controller. Each action to
    # controller is writing in temporary file.
    def swagger_doc(action, &block)
      parse = ParserAction.new(action, &block)
      parse.adding_path
    end

    # Complete definitions objects for each controller.
    def swagger_definition(name, &block)
      parse = ParserDefinition.new(name, &block)
      parse.adding_definition
    end

    # Create section for display a README in top to documentation
    def swagger_readme(readme_file)
      parse = ParserReadme.new(readme_file)
      parse.adding_readme
    end

    alias scontroller   swagger_controller
    alias sdoc          swagger_doc
    alias sdefinition   swagger_definition
    alias sreadme       swagger_readme
  end
end
