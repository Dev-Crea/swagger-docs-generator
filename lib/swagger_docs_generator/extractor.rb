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

    # Extract verb to routes
    def verb
      router do |route|
        route.verb.source.to_s.delete('$' + '^')
      end
    end

    # Extract path to routes and change format to parameter path
    def path
      router do |route|
        route.path.spec.to_s.gsub('(.:format)', '.json').gsub(':id', '{id}')
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
      @controller.controller_path
    end

    def router
      data = nil
      @routes.map do |route|
        rte = route.defaults
        data = yield(route, rte) if rte_controller(rte) && rte_action(rte)
      end
      data.downcase
    end
  end
end
