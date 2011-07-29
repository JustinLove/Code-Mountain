require 'spec_helper'

describe Task do
  describe 'instance methods' do
    Given!(:lesson1) {Factory(:lesson, :title => 'one', :detail => 'oneone')}
    Given!(:lesson2) {Factory(:lesson, :title => 'two', :detail => 'twotwo')}
    Given!(:user) {Factory(:user)}
    subject {Task.new(:lesson => lesson1, :user => user)}
    it {should be_valid}
    its(:title) {should == lesson1.title}
    its(:detail) {should == lesson1.detail}
    its(:complete?) {should be_false}
    its(:next) {should be_kind_of(Task)}
    its(:next) {subject.lesson.should == lesson2}

    describe 'complete task' do
      subject {Task.new(:lesson => lesson1, :status => 'complete')}
      its(:complete?) {should be_true}
    end
  end
end
