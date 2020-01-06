require 'spec_helper'

describe package('git'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
