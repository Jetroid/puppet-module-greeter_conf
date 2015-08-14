require 'spec_helper'
describe 'greeter_conf' do

  context 'with defaults for all parameters' do
    it { should contain_class('greeter_conf') }
  end
end
