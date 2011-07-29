class Lesson < ActiveRecord::Base
  has_many :tasks

  def self.incomplete(user)
    # FIXME: This will query every lesson and it's task, but NOT IN doesn't work
    Lesson.all.reject do |l|
      l.task(user) && l.task(user).complete?
    end
  end

  def task(user)
    tasks.where(:user_id => user.id).first
  end

  def next
    Lesson.find(id + 1)
  end
end
