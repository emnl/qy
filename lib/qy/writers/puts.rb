module Qy
  module Writers
    class Puts < Writer
      def write_entry(entry)
        puts entry
      end
    end
  end
end
