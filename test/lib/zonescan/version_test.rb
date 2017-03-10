require_relative '../../test_helper'
describe Zonescan do
  it 'must be defined' do
    Zonescan::VERSION.wont_be_nil
  end
end
