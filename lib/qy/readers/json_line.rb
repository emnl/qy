require 'json'

module Qy
  module Readers
    class JsonLine < Reader
      def initialize(options)
        @file = File.open(options[:file], "r")
      end

      def read_entry
        line = @file.gets("\n")
        return nil unless line
        JSON.parse(line)
      end

      def after
        @file.close
      end
    end
  end
end
