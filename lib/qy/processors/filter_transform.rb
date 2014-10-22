module Qy
  module Processors
    class FilterTransform < Processor
      def initialize(reader, writer, options)
        @filters = options[:filters]
        @transforms = options[:transforms]

        while entry = reader.read_entry
          res = filter_transform(entry)
          writer.write_entry(res) if res
        end
      end

      def filter_transform(entry)
        @filters.each do |f|
          field = f.keys.first
          filter = f.values.first
          return nil unless entry.has_key?(field)
          return nil unless filter.call(entry[field])
        end

        if @transforms
          transforms = Hash.new
          @transforms.each do |field|
            return nil unless entry.has_key?(field)
            transforms[field] = entry[field]
          end
          return transforms
        else
          return entry
        end
      end
    end
  end
end
