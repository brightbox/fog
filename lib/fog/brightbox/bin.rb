module Brightbox
  class << self

    if Fog.credentials[:brightbox_client_id] && Fog.credentials[:brightbox_secret]

      def initialized?
        true
      end

      def [](service)
        @@connections ||= Hash.new do |hash, key|
          hash[key] = case key
          when :compute
            Fog::Brightbox::Compute.new
          end
        end
        @@connections[service]
      end

      def services
        [:compute]
      end

      for collection in Fog::Brightbox::Compute.collections
        module_eval <<-EOS, __FILE__, __LINE__
          def #{collection}
            self[:compute].#{collection}
          end
        EOS
      end

    else

      def initialized?
        false
      end

    end
  end
end
