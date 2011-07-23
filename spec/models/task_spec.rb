require 'spec_helper'

describe Task do
  describe 'instance methods' do
    Given!(:lesson1) {Factory(:lesson, :title => 'one', :detail => 'oneone')}
    Given!(:lesson2) {Factory(:lesson)}
    subject {Task.new(:lesson => lesson1)}
    its(:next) {should be}
    its(:next) {subject.lesson.should == lesson2}
    its(:title) {should == lesson1.title}
    its(:detail) {should == lesson1.detail}
  end
end