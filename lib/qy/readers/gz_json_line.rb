require 'java'
require 'json'
java_import java.util.zip.GZIPInputStream
java_import java.io.FileInputStream
java_import java.io.BufferedReader
java_import java.io.InputStreamReader

module Qy
  module Readers
    class GzJsonLine < Reader
      def initialize(options)
        @gzip = GZIPInputStream.new(FileInputStream.new(options[:file]))
        @br = BufferedReader.new(InputStreamReader.new(@gzip))
      end

      def read_entry
        line = @br.readLine
        return nil unless line
        JSON.parse(line)
      end

      def after
        @br.close
        @gzip.close
      end
    end
  end
end
