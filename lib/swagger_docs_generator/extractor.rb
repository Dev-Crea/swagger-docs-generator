# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Extractor routes info
  #
  # Give information about routes
  class Extractor
    def initialize(controller, action)
      @action = action
      @controller = controller
      @routes = Rails.application.routes.routes
    end

    def verb
      verb = nil
      @routes.map do |route|
        rte = route.defaults
        if rte_controller(rte) && rte_action(rte)
          verb = route.verb.source.to_s.delete('$'+'^')
          return verb.downcase
        end
      end
    end

    private

    def rte_controller(rte)
      rte[:controller].eql?(controller_name)
    end

    def rte_action(rte)
      rte[:action].eql?(@action.to_s)
    end

    def controller_name
      @controller.controller_name
    end
  end
end
