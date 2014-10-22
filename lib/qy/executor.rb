require 'java'
require 'thread'
java_import java.util.concurrent.Executors
java_import java.util.concurrent.ExecutorCompletionService
java_import java.util.concurrent.Callable

module Qy
  class Executor
    def initialize(options)
      @reader_class       = options[:reader].keys.first
      @writer_class       = options[:writer].keys.first
      @reader_instances   = options[:reader].values.first
      @writer_instances   = options[:writer].values.first
      @processor_class    = options[:processor].keys.first
      @processor_options  = options[:processor].values.first
      @executor_options   = options[:options] || {}

      unless @reader_instances.length == @writer_instances.length
        raise "Uneven readers and writers"
      end

      max_threads = @executor_options[:workers] || 1
      @thread_pool = Executors.newFixedThreadPool(max_threads)
      @pool = ExecutorCompletionService.new(@thread_pool)
      @pool_size = @reader_instances.length
    end

    def execute
      raise "The executor has already been executed" if @thread_pool.isShutdown
      until @reader_instances.empty? || @writer_instances.empty?
        @pool.java_send(:submit, [Callable.java_class], Worker.new(@reader_class, @writer_class, @reader_instances.shift, @writer_instances.shift, @processor_class, @processor_options))
      end
      @pool_size.times do
        @pool.take
      end
      @thread_pool.shutdown
    end
  end
end
