require 'java'
require 'thread'
java_import java.util.concurrent.Executors
java_import java.util.concurrent.ExecutorCompletionService
java_import java.util.concurrent.Callable

module Qy
  class Executor
    def initialize(options)
      @reader_class     = options[:readers].keys.first
      @writer_class     = options[:writers].keys.first
      @reader_instances = options[:readers].values.first.clone
      @writer_instances = options[:writers].values.first.clone
      @processor        = options[:processor]
      @options          = options[:options] || {}

      unless @reader_instances.length == @writer_instances.length
        raise "There must be an equal number of readers and writers."
      end

      max_threads = @options[:workers] || 1
      @thread_pool = Executors.newFixedThreadPool(max_threads)
    end

    def execute
      raise "The executor has already been executed" if @thread_pool.isShutdown
      pool = ExecutorCompletionService.new(@thread_pool)
      work_size = @reader_instances.length

      until @reader_instances.empty? || @writer_instances.empty?
        pool.java_send(:submit, [Callable.java_class], Worker.new(@reader_class, @writer_class, @reader_instances.shift, @writer_instances.shift, @processor))
      end

      work_size.times { pool.take.get }
      @thread_pool.shutdown
    end
  end
end
