class PagesController < ApplicationController
  def tutorial
    render :layout => 'navless'
  end

  def get_help
    render :layout => 'navless'
  end
end
