require 'spec_helper'

describe 'happy_path' do
  subject {response}
  When {visit root_path}
  it {should be_success}
end
