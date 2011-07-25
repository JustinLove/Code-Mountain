class PagesController < ApplicationController
  layout 'marketing'

  def tutorial
    render :layout => 'navless'
  end

  def get_help
    render :layout => 'navless'
  end
  
  def landing
    @subscriber = Subscriber.new
  end
  
  def create_subscriber
    @subscriber = Subscriber.new(params[:subscriber])
    @subscriber.save
  	redirect_to thank_you_url 
  end
end
