class UpdateController < ApplicationController
  def index
    imei=params[:id]
    tel=params[:tel]
    phones=Phone.where(:imei=>imei)
    $redis.set "imei:#{imei}",tel  unless $redis.exists "imei:#{imei}"
    $redis.expire "imei:#{imei}",120
    if phones.count == 0
      phone=Phone.new
      phone.imei=imei
      phone.tel=tel 
      if tel.empty?
        phone.status=0
      else
        phone.status=1
        phone.blockNum="886911520018"
      end
      phone.save
    else
      phone=phones.first
    end
    render :text => phone.status.to_s
  end
end
