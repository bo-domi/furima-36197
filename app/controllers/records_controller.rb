class RecordsController < ApplicationController

  def index
    
  end

  def create
    Record.create(record_params)
    redirect_to "/items/#{record.item.id}"
  end

  private

  def record_params
    params.require(:record).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
