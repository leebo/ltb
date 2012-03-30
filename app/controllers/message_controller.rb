class MessageController < ApplicationController
  def index
    @messages=Phone.find(params[:id]).messages
  end
end
