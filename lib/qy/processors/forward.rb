module Qy
  module Processors
    class Forward < Processor
      def initialize(reader, writer, options)
        while entry = reader.read_entry
          writer.write_entry(entry)
        end
      end
    end
  end
end
