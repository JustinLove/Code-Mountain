class Lesson < ActiveRecord::Base
  def create_task
    Task.create(:lesson => self)
  end
end
