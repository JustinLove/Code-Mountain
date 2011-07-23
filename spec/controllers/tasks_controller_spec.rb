require 'spec_helper'

describe TasksController do
  subject {response}

  Given!(:lesson1) {Factory(:lesson, :title => 'one')}
  Given!(:lesson2) {Factory(:lesson, :title => 'two')}
  Given(:task1) {lesson1.create_task}

  describe 'create' do
    describe 'first task' do
      When {post :create}
      it {should be_redirect}
      its(:location) {should match(/task/)}
      describe 'task' do
        subject {controller.next_task}
        it {should be}
        its(:lesson) {should == lesson1}
      end
    end

    describe 'second task' do
      When {post :create, :previous_task => task1.id}
      describe 'task' do
        subject {controller.next_task}
        it {should be}
        its(:lesson) {should == lesson2}
      end
    end
  end
end
