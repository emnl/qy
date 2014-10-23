module Qy
  module Readers
    class Shared < Reader
      def initialize(options)
        @lambda = options
      end

      def read_entry
        @lambda.call
      end
    end
  end
end
