require 'json'
require 'fileutils'

module Qy
  module Writers
    class FileJsonLine < Writer
      def initialize(options)
        FileUtils.mkdir_p(File.dirname(options))
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
