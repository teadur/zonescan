require_relative '../../test_helper'

describe Zonescan::Domain do

  subject { Zonescan::Domain }

  it 'must return a random domain' do
    subject.domain.must_be_instance_of(String)
  end

  it 'must return 5 domain by default' do
    subject.domains.size.must_equal(5)
  end

  it 'must return the specified amount of domains' do
    subject.domains(10).size.must_equal(10)
  end

  it 'must discard names without dot' do
    subject.validate('test')
  end

end
