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
      subject {Lesson.incomplete}
      it {p subject}
      it {should have(2).items}
      its(:first) {should == lesson2}
      its(:last) {should == lesson3}
    end
  end

  describe 'instance methods' do
    Given!(:lesson) {Factory(:lesson)}
    subject {lesson}
    it {should be}

    describe 'build tasks' do
      subject {lesson.build_task}
      it {should be}
      it {should be_kind_of(Task)}
      its(:lesson) {should == lesson}
    end
    describe 'create tasks' do
      subject {lesson.create_task(:user => user)}
      its(:id) {should be}
    end

    describe '#task!' do
      Given(:lesson) {Factory(:lesson)}
      describe 'no task' do
        subject {lesson.task!(user)}
        it {should be_new_record}
        it {should_not be_complete}
      end
      describe 'incomplete task' do
        Given {lesson.create_task(:user => user)}
        subject {lesson.task!(user)}
        it {should_not be_new_record}
        it {should_not be_complete}
      end
      describe 'complete task' do
        Given {lesson.create_task(:user => user, :status => 'complete')}
        subject {lesson.task!(user)}
        it {should_not be_new_record}
        it {should be_complete}
      end
    end
  end
end
