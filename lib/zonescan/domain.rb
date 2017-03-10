module Zonescan
  # Base class for Zonescan
  class Domain < Base
    def self.domain
      processed_source.sample
    end

    def self.domains(n = 5)
      processed_source.sample(n)
    end
  end
end
