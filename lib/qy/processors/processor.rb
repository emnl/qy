module Qy
  module Processors
    class Processor
      def initialize(reader, writer, options)
        raise NotImplementedError
      end
    end
  end
end
