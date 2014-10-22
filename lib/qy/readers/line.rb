require 'json'

module Qy
  module Readers
    class Line < Reader
      def initialize(options)
        @file = File.open(options[:file], "r")
      end

      def read_entry
        @file.gets("\n")
      end

      def after
        @file.close
      end
    end
  end
end
