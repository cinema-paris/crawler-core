require 'active_support/inflector'
require 'levenshtein-ffi'

module Crawler
  module Utils
    def self.transliterate(string)
      ActiveSupport::Inflector.transliterate(string.gsub(/[:\-.,!?]/, ' ').strip.gsub(/\s+/, ' '), nil).downcase
    end

    def self.levenshtein_score(string_1, string_2)
      string_1_transliterated = transliterate(string_1)
      string_2_transliterated = transliterate(string_2)
      levenshtein_distance = Levenshtein.distance(string_1_transliterated, string_2_transliterated)
      max_size = [string_1_transliterated.size, string_2_transliterated.size].max.to_f

      (max_size - levenshtein_distance) / max_size
    end
  end
end
