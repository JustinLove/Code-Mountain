class Task < ActiveRecord::Base
  belongs_to :lesson

  def self.delegate(what)
    define_method what do
      lesson.__send__ what
    end
  end
  delegate :title
  delegate :detail

  def complete?
    status == 'complete'
  end
end
