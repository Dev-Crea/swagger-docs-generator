# frozen_string_literal: true

# :reek:UtilityFunction
module SwaggerDocsGenerator
  # # Methods for controller
  #
  # Methods adding to controller parsing in rails appliation
  module Methods
    # Create json file for controller
    def swagger_controller(controller, description)
      parse = ParserController.new(controller, description)
      parse.adding_tag
    end

    # Complete json file with datas to method and controller, controller reading
    def swagger_doc(controller, action, data = {})
      parse = ParserAction.new(controller, action, data)
      parse.adding_path
    end

    alias scontroller swagger_controller
    alias sdoc swagger_doc
  end
end
