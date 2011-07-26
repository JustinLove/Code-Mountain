class PagesController < ApplicationController
  layout 'marketing'

  def dashboard
    render :layout => 'application'
  end

  def start
    render :layout => 'application'
  end

  def congrats
    render :layout => 'application'
  end

  def tutorial
    render :layout => 'navless'
  end

  def get_help
    render :layout => 'dialog'
  end

  def help_confirm
    render :layout => 'dialog'
  end

  def get_response
    render :layout => 'dialog'
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
