class Lesson < ActiveRecord::Base
  has_many :tasks

  def self.incomplete(user)
    # FIXME: This will query every lesson and it's task, but NOT IN doesn't work
    Lesson.all.reject do |l|
      l.task(user) && l.task(user).complete?
    end
  end

  def task(user)
    Task.where(:lesson_id => id, :user_id => user.id).first
  end

  def task!(user)
    task(user) || tasks.build(:user => user)
  end
end
