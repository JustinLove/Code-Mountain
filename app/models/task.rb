class Task < ActiveRecord::Base
  belongs_to :lesson

  delegate :title, :to => :lesson
  delegate :detail, :to => :lesson
  delegate :link, :to => :lesson
  delegate :benefits, :to => :lesson

  def complete?
    status == 'complete'
  end

  def next
    Lesson.find(lesson_id + 1).task!
  end
end
