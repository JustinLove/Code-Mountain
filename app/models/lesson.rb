class Lesson < ActiveRecord::Base
  has_one :task

  def task!
    task || build_task
  end
end
