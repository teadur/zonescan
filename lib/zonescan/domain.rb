module Zonescan
    class Domain < Base

      def self.domain
        self.processed_source.sample
      end

      def self.domains(n=5)
        self.processed_source.sample(n)
      end

    end
end