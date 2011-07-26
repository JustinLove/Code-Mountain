class DashboardController < ApplicationController
  expose(:next_task) { Lesson.incomplete.first.task! }
end
