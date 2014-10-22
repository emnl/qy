module Qy
  module Writers
    class Nil < Writer
      def write_entry(entry)
        nil
      end
    end
  end
end
