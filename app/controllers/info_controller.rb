class InfoController < ApplicationController
  def index
    imei=params[:imei]
    phone=Phone.where(:imei => imei).fisrt
    render :text => "all" if phone.blockNum.nil? && phone.blcokStr.nil?
    render :text => "blockNum:#{phone.blockNum}" unless phone.blockNum.nil?
    render :text => "blockStr:#{phone.blockStr}" unless phone.blockStr.nil?
  end
end
