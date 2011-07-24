class LessonsController < ApplicationController
  expose(:lessons) {Lesson.all}

  def index
  end
end
