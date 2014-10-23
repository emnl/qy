require 'java'
java_import java.util.concurrent.Callable

module Qy
  class Worker
    include Callable

    def initialize(reader_class, writer_class, reader_instance, writer_instance, processor)
      @reader_class    = reader_class
      @writer_class    = writer_class
      @reader_instance = reader_instance
      @writer_instance = writer_instance
      @processor       = processor
    end

    def call
      reader = @reader_class.new(@reader_instance)
      writer = @writer_class.new(@writer_instance)
      run_processor(reader, writer)
      reader.after
      writer.after
    end

    def run_processor(reader, writer)
      if @processor.is_a?(Proc)
        @processor.call(reader, writer)
      else
        klass = @processor.keys.first
        options  = @processor.values.first
        klass.new(reader, writer, options)
      end
    end
  end
end
