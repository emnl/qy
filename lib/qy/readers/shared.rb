module Qy
  module Readers
    class Shared < Reader
      def initialize(options)
        @read_entry = options[:read_entry]
      end

      def read_entry
        @read_entry.call
      end
    end
  end
end
