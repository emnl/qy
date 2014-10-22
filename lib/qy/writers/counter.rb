module Qy
  module Writers
    class Counter < Writer
      def initialize(options)
        @file = File.open(options[:file], "w")
        @count = 0
      end

      def write_entry(entry)
        @count += 1
      end

      def after
        @file.puts(@count)
        @file.close
      end
    end
  end
end
