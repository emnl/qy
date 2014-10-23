require 'json'

module Qy
  module Readers
    class FileLine < Reader
      def initialize(options)
        @file = File.open(options, "r")
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
