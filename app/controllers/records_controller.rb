class RecordsController < ApplicationController

  def index
    @record_address = RecordAddress.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      render "records/index"
    end
  end
  

  private

  def record_params
    params.require(:record_address).permit(:postal_code, :area_id, :municipality, :house_number, :building_name, :telephone_number, :record_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
