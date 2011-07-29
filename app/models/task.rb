class Task < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :user

  validates_presence_of :lesson_id
  validates_presence_of :user_id

  delegate :title, :to => :lesson
  delegate :detail, :to => :lesson
  delegate :link, :to => :lesson
  delegate :benefits, :to => :lesson

  def complete?
    status == 'complete'
  end

  def next
    Lesson.find(lesson_id + 1).task!(user)
  end
end
