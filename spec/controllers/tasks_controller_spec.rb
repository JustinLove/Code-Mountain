require 'spec_helper'

describe TasksController do
  include Devise::TestHelpers
  subject {response}

  Given!(:user) {Factory(:user)}
  Given!(:lesson1) {Factory(:lesson, :title => 'one')}
  Given!(:lesson2) {Factory(:lesson, :title => 'two')}
  Given!(:task1) {lesson1.create_task(:user => user)}

  describe 'exposures' do
    Given {sign_in user}
    describe '#next_task' do
      Given {controller.stub(:task) {task1}}
      subject {controller.next_task}
      it {should be}
    end
  end

  describe 'create' do
    Given {sign_in user}
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
    Given {sign_in user}
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
