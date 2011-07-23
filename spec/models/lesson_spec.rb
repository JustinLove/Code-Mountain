require 'spec_helper'

describe Lesson do
  describe 'class methods' do
    subject {Lesson}
  end

  describe 'instance methods' do
    Given(:lesson) {Lesson.new}
    subject {lesson}
    it {should be}
    its(:create_task) {should be_kind_of(Task)}
    its(:create_task) {subject.lesson.should == lesson}
  end
end
