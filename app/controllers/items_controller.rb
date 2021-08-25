class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
   #@items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  #def destroy
    #item = Item.find(params[:id])
    #item.destroy
  #end

  #def edit

  #end

  #def show

 #end


private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :detail_id, :delivery_price_id, :day_id, :price, :area_id).merge(user_id: current_user.id)
  end

end
