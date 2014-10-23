require 'json'

module Qy
  module Writers
    class FileJsonLine < Writer
      def initialize(options)
        @file = File.open(options, "w")
      end

      def write_entry(entry)
        @file.puts(entry.to_json)
      end

      def after
        @file.close
      end
    end
  end
end
