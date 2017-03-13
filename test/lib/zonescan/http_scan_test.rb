require_relative '../../test_helper'

describe Zonescan::Httpscan do
  subject { Zonescan::Httpscan }
  it 'must return integer' do
    subject.check('internet.ee').must_be_instance_of(Integer)
  end
  it 'must return integer in value range of http response code' do
    subject.check('internet.ee').between?(200, 600).must_equal true
  end
end
