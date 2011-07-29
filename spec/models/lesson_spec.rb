require 'spec_helper'

describe Lesson do
  Given(:user) {Factory(:user)}

  describe 'class methods' do
    Given(:other_user) {Factory(:user)}
    Given!(:lesson1) {Factory(:lesson)}
    Given!(:lesson2) {Factory(:lesson)}
    Given!(:lesson3) {Factory(:lesson)}
    Given!(:complete) do
      Factory(:task,
              :lesson => lesson1,
              :user => user,
              :status => 'complete')
    end
    Given!(:incomplete) do
      Factory(:task,
              :lesson => lesson2,
              :user => user)
    end
    Given!(:other_task) do
      Factory(:task,
              :lesson => lesson1,
              :user => other_user)
    end
    subject {Lesson}

    describe 'incomplete' do
      subject {Lesson.incomplete(user)}
      it {should have(2).items}
      its(:first) {should == lesson2}
      its(:last) {should == lesson3}
    end
    describe 'incomplete by user' do
      subject {Lesson.incomplete(other_user)}
      it {should have(3).items}
    end
  end

  describe 'instance methods' do
    Given!(:lesson) {Factory(:lesson)}
    subject {lesson}
    it {should be}

    describe 'build tasks' do
      subject {lesson.tasks.build}
      it {should be}
      it {should be_kind_of(Task)}
      its(:lesson) {should == lesson}
    end
    describe 'create tasks' do
      subject {lesson.tasks.create(:user => user)}
      its(:id) {should be}
    end
  end
end
