class AdminController < ApplicationController
  def index
    if session[:user].nil?
      redirect_to :action => :login
    else
      case params[:a]
      when "alive"
        @phones = Phone.where("this.tel != ''")
      when "use"
        @phones=Phone.where("this.tel != ''")
      else
        @phones=Phone.all
      end
    end
  end
  def alive?(imei)
    $redis.exists "imei:#{imei}"
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
