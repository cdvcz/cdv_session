module CdvSession
  class ServiceResource < ActiveResource::Base

    protected

    class CustomFormat
      include ActiveResource::Formats::JsonFormat

      class MetaArray < Array
        mattr_accessor :metadata

        def meta=(data)
          self.metadata = ActiveSupport::JSON.encode(data)
        end

        def meta
          OpenStruct.new ActiveSupport::JSON.decode(metadata)
        end
      end

      def decode(json)
        data = ActiveSupport::JSON.decode(json)

        if data['content'].is_a?(Array)
          result = MetaArray.new

          result.meta = data['meta']

          data['content'].each do |entry|
            result << entry
          end

          result
        else
          data['content']
        end
      end
    end

    self.format = CustomFormat.new
  end
end
