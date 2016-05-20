require 'spec_helper'
describe 'systemd' do
  context 'with defaults for all parameters' do
    it { should contain_class('systemd') }
  end
  
  context 'if no service defined' do
    it "Should not contain any resources" do
      should have_resource_count(0)
    end
  end
end
