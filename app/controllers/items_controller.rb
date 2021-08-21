class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
   @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to action: "show"
  else
    render :index
  end
end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit

  end

  def show

  end


private

def itme_params
  params.require(:item).permit(:content, :image).merge(user_id: current_user.id)


end

end
