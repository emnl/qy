module Qy
  module Processors
    class Counter < Processor
      def initialize(reader, writer, options)
        n = 0
        n += 1 while entry = reader.read_entry
        writer.write_entry(n)
      end
    end
  end
end
