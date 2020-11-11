require 'active_support/concern'
require 'active_support/inflector'
require 'levenshtein-ffi'

module Crawler
  module Base
    extend ActiveSupport::Concern

    class_methods do
      def add_provider(_provider_name, _options = {})
        raise NotImplementedError
      end

      def configure
        yield self
      end
    end
  end
end
