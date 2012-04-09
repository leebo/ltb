class GetController < ApplicationController
  def index
    begin
      imeis=$redis.keys "imei:*"
      if imeis.length==0
        render :text => "no tel alive"
        return
      end
      imei=imeis[Random.rand(imeis.length)].split(":")[1]
      phone=Phone.where(:imei=> imei).first
      if phone.nil?
        render :text => "no tel"
        return
      end
    end while phone.status == 0

    render :text => "#{phone.tel} <a href='/message/index/#{phone.id}'>show message</a>"
    
  end
end
