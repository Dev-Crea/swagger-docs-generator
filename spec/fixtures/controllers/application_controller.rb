# frozen_string_literal: true

class ApplicationController
  cattr_accessor :context
  self.context = 'original'
end
