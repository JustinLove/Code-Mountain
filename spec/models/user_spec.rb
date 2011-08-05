require 'spec_helper'

describe User do
  describe 'instance methods' do
    Given(:user) {Factory(:user)}

    describe '#next_task' do
      subject {user.next_task}
      describe 'first task' do
        Given!(:task1) {Factory(:task, :user => user)}
        Given!(:task2) {Factory(:task, :user => user)}
        it {should == task1}
      end
      describe 'second task' do
        Given!(:task1) {Factory(:task, :user => user, :status => 'complete')}
        Given!(:task2) {Factory(:task, :user => user)}
        it {should == task2}
      end
    end

    describe '#start' do
      Given(:lesson) {Factory(:lesson)}
      subject {user.start(lesson)}
      describe 'new task' do
        it {should be_new_record}
        its(:lesson) {should == lesson}
      end
      describe 'existing task' do
        Given!(:task) {Factory(:task, :lesson => lesson, :user => user)}
        it {should_not be_new_record}
      end
    end
  end
end
