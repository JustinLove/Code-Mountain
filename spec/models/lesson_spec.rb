require 'spec_helper'

describe Lesson do
  describe 'class methods' do
    subject {Lesson}
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
      subject {lesson.create_task}
      its(:id) {should be}
    end

    describe '#task!' do
      Given(:lesson) {Factory(:lesson)}
      describe 'no task' do
        subject {lesson.task!}
        it {should be_new_record}
        it {should_not be_complete}
      end
      describe 'incomplete task' do
        Given {lesson.create_task}
        subject {lesson.task!}
        it {should_not be_new_record}
        it {should_not be_complete}
      end
      describe 'complete task' do
        Given {lesson.create_task(:status => 'complete')}
        subject {lesson.task!}
        it {should_not be_new_record}
        it {should be_complete}
      end
    end
  end
end
