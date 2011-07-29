class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  has_many :tasks

  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false

  def next_task
    start(Lesson.incomplete(self).first)
  end

  def start(lesson)
    find_task(lesson) || tasks.build(:lesson => lesson)
  end

  private
  def find_task(lesson)
    tasks.where(:lesson_id => lesson.id).first
  end
end
