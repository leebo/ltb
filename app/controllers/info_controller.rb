class InfoController < ApplicationController
  def index
    imei=params[:imei]
    phone=Phone.where(:imei => imei).first
    if phone.nil? || phone.status==0
      render :text => "no"
    elsif !phone.blockNum.nil? && !phone.blockNum.empty?
      render :text => "blockNum:#{phone.blockNum}"
    elsif !phone.blockStr.nil? && !phone.blockStr.empty?
      render :text => "blockStr:#{phone.blockStr}"
    else
      render :text => "all" 
    end
  end
end
