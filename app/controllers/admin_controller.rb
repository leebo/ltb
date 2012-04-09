class AdminController < ApplicationController
  scope :alive_and_hastel, where("tel is not null")
  def index
    if session[:user].nil?
      redirect_to :action => :login
      return
    end
    @phones=Phone.all
  end

  def login
    user=params[:u]
    pass=params[:p]
    if user=="abc831" && pass=="abc831"
      session[:user] = user
      redirect_to :action => :index
    end
  end

  def logout
    session[:user]=nil unless session[:user].nil?
    render :text => :ok
  end

  def edit
    @phone=Phone.find(params[:id])
  end

  def update
    @phone=Phone.find(params[:id])
    if @phone.update_attributes(params[:phone])
      redirect_to :action => :index
    end
  end
end
