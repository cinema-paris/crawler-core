require 'active_support/concern'
require 'active_support/inflector'
require 'crawler/configuration'

module Crawler
  module Base
    extend ActiveSupport::Concern
    include Configuration

    class_methods do
      def add_provider(_provider_name, _options = {})
        raise NotImplementedError
      end
    end
  end
end
