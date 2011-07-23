require 'spec_helper'

describe Task do
  describe 'instance methods' do
    Given!(:lesson1) {Factory(:lesson)}
    Given!(:lesson2) {Factory(:lesson)}
    subject {Task.new(:lesson => lesson1)}
    its(:next) {should be}
    its(:next) {subject.lesson.should == lesson2}
  end
end
