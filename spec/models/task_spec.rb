require 'spec_helper'

describe Task do
  describe 'instance methods' do
    Given!(:lesson1) {Factory(:lesson, :title => 'one', :detail => 'oneone')}
    subject {Task.new(:lesson => lesson1)}
    its(:title) {should == lesson1.title}
    its(:detail) {should == lesson1.detail}
    its(:complete?) {should be_false}

    describe 'complete task' do
      subject {Task.new(:lesson => lesson1, :status => 'complete')}
      its(:complete?) {should be_true}
    end
  end
end
