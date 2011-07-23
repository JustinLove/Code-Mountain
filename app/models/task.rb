class Task < ActiveRecord::Base
  belongs_to :lesson

  def next
    Task.new(:lesson_id => lesson_id + 1)
  end
end
