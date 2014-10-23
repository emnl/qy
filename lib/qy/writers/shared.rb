module Qy
  module Writers
    class Shared < Writer
      def initialize(options)
        @lambda = options
      end

      def write_entry(entry)
        @lambda.call(entry)
      end
    end
  end
end
