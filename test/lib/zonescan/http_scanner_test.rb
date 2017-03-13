require_relative '../../test_helper'

describe Zonescan::Httpscan do
  subject { Zonescan:Httpscan }

    it 'must return integer'
    subject.check.must_be_instance_of(Integer)

    it 'must return integer in value range of http response code'
    subject.check.between(200, 600)
end