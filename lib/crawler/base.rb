require 'active_support/concern'
require 'active_support/inflector'
require 'levenshtein-ffi'

module Crawler
  module Base
    extend ActiveSupport::Concern

    class_methods do
      def add_provider(provider_name, options = {})
        raise NotImplementedError
      end

      def configure
        yield self
      end

      def search(*args)
        raise NotImplementedError
      end

      def best(*args)
        raise NotImplementedError
      end
    end
  end
end
