require 'java'
java_import java.util.concurrent.Callable

module Qy
  class Worker
    include Callable

    def initialize(reader_class, writer_class, reader_instance, writer_instance, processor_class, processor_options)
      @reader_class = reader_class
      @writer_class = writer_class
      @reader_instance = reader_instance
      @writer_instance = writer_instance
      @processor_class = processor_class
      @processor_options = processor_options
    end

    def call
      reader = @reader_class.new(@reader_instance)
      writer = @writer_class.new(@writer_instance)
      @processor_class.new(reader, writer, @processor_options)
      reader.after
      writer.after
      nil
    end
  end
end
