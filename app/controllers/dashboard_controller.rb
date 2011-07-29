class DashboardController < ApplicationController
  before_filter :authenticate_user!

  expose(:next_task) {current_user.next_task}

  def index
    next_task.save!
  end
end
