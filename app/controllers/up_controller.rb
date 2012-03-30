class UpController < ApplicationController
  def index
    imei=params[:id]
    tel=params[:t]
    context=params[:body]
    phone=Phone.where(:imei => imei).first
    if phone.nil?
      render :text => "error"
    else
      message=Message.new
      message.tel=tel
      message.context=context
      phone.messages.push(message)
      render :text => "ok"
    end
  end
end
