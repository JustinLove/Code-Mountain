require 'spec_helper'

describe LessonsController do
  subject {response}

  Given!(:lesson1) {Factory(:lesson)}
  Given!(:lesson2) {Factory(:lesson)}

  describe 'index' do
    When {get :index}
    it {should be_success}

    describe 'lessons' do
      subject {controller.lessons}
      it {p subject}
      it {should be}
      its(:length) {should == 2}
    end
  end
end
