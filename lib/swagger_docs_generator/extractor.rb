# frozen_string_literal: true

# :reek:NestedIterators
# :reek:TooManyStatements
# :reek:UtilityFunction

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
      temporary = []
      actual_route = nil
      router do |route|
        actual_route = extract_and_format_route(route)
        temporary.push(actual_route) unless temporary.include?(actual_route)
        actual_route
      end
      temporary
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

    def extract_and_format_route(route)
      route.path.spec.to_s.gsub('(.:format)',
                                '.json').gsub(/:[a-z1-9_A-Z]*/) do |word|
        "{#{word.delete(':')}}"
      end
    end
  end
end
