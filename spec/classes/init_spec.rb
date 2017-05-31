require 'spec_helper'
describe 'hyperscale' do

  context 'with defaults for all parameters' do
    it { should contain_class('hyperscale') }
  end
end
