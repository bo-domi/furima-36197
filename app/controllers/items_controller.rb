class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:update, :edit]

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
  end

  def show
  end

   def update
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

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  
end
