module Qy
  module Writers
    class Writer
      def initialize(options)
        nil
      end

      def write_entry(entry)
        raise NotImplementedError
      end

      def after
        nil
      end
    end
  end
end
