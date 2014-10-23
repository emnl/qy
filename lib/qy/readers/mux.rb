module Qy
  module Readers
    class Mux < Reader
      def initialize(options)
        @reader_class     = options.keys.first
        @reader_instances = options.values.first
      end

      def read_entry
        if @cur
          entry = @cur.read_entry
          if entry == nil
            @cur.after
            @cur = nil
            return read_entry
          else
            return entry
          end
        else
          if @reader_instances.empty?
            return nil
          else
            @cur = @reader_class.new(@reader_instances.shift)
            return read_entry
          end
        end
      end
    end
  end
end
