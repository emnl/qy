require 'fileutils'

module Qy
  module Writers
    class FileLine < Writer
      def initialize(options)
        FileUtils.mkdir_p(File.dirname(options))
        @file = File.open(options, "w")
      end

      def write_entry(entry)
        @file.puts(entry)
      end

      def after
        @file.close
      end
    end
  end
end
