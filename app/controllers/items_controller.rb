class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
   @items = Item.order("id DESC")
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
   # @item = Item.find(params[:id])
    #@item.destroy
  #end

  def edit
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
      redirect_to root_path
  end
end

  def show
    @item = Item.find(params[:id])
 end

   def update
     @item = Item.find(params[:id])
     if @item.update(item_params)
      redirect_to action: "show"
     else
      render :edit
     end
   end


private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :detail_id, :delivery_price_id, :day_id, :price, :area_id).merge(user_id: current_user.id)
  end

  
end
