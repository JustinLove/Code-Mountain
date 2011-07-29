class Lesson < ActiveRecord::Base
  has_one :task

  def self.incomplete
    # FIXME: This will query every lesson and it's task, but NOT IN doesn't work
    Lesson.all.reject do |l|
      l.task && l.task.complete?
    end
  end

  def task!(user)
    task || build_task(:user => user)
  end
end
