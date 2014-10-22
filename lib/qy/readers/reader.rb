module Qy
  module Readers
    class Reader
      def initialize(options)
        nil
      end

      def read_entry
        raise NotImplementedError
      end

      def after
        nil
      end
    end
  end
end
