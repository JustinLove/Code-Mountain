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
  end
end
