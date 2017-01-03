# frozen_string_literal: true

module SwaggerDocsGenerator
  module Methods
    def swagger_controller(description, params = {})
      puts "Controller : #{self.name}"
      puts "Description : #{description}"
      puts "Params : #{params}"
    end

    def swagger_doc(action, &block)
      puts "Action : #{action}"
      puts "Block : #{block}"
    end
  end
end
