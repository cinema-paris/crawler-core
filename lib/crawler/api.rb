require 'active_support/concern'
require 'active_support/inflector'
require 'faraday'

module Crawler
  module Api
    extend ActiveSupport::Concern

    class_methods do
      def connection(**opts)
        url = self.const_defined?(:API_URL) ? self::API_URL : nil
        user_agent = opts.key?(:user_agent) ? opts[:user_agent] : 'Mozilla/5.0 (Crawler/1.0; +https://cinema.paris)'

        Faraday.new(url: url, headers: { user_agent: user_agent }) do |faraday|
          faraday.request :url_encoded
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter Faraday.default_adapter
        end
      end
    end
  end
end
