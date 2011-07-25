class Lesson < ActiveRecord::Base
  has_one :task

  def self.incomplete
    t = Task.arel_table
    complete = t.where(t[:status].eq('complete')).project(t[:id])
    Lesson.where(arel_table[:id].not_in(complete))
  end

  def task!
    task || build_task
  end
end
