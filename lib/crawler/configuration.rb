require 'active_support/concern'
require 'active_support/inflector'
require 'singleton'

module Crawler
  module Configuration
    extend ActiveSupport::Concern

    included do
      module_eval <<-METHODS, __FILE__, __LINE__ + 1
        class Configuration
          include Singleton
        end
      METHODS
    end

    class_methods do
      def config
        self::Configuration.instance
      end

      def configure
        yield config
      end
    end
  end
end
