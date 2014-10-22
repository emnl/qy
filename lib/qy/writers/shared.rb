module Qy
  module Writers
    class Shared < Writer
      def initialize(options)
        @write_entry = options[:write_entry]
      end

      def write_entry(entry)
        @write_entry.call(entry)
      end
    end
  end
end
