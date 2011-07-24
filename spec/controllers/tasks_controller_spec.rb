require 'spec_helper'

describe TasksController do
  subject {response}

  Given!(:lesson1) {Factory(:lesson, :title => 'one')}
  Given!(:lesson2) {Factory(:lesson, :title => 'two')}
  Given!(:task1) {lesson1.create_task}

  describe 'create' do
    When {post :create, :task => {:lesson => lesson1}}
    it {should be_redirect}
    its(:location) {should match(/task/)}
    describe 'task' do
      subject {controller.task}
      it {should be}
      its(:lesson) {should == lesson1}
    end
  end

  describe 'update' do
    describe 'complete' do
      When {post :update, :id => task1.id, :task => {:status => 'complete'}}
      it {should be_redirect}
      describe 'task' do
        subject {controller.task}
        it {should be}
        its(:status) {should == 'complete'}
        it('saved') {Task.find(task1.id).status.should == 'complete'}
      end
    end
  end
end
