class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :introduction, :user, :price, :prefecture_id, :postage_id,
                                 :shopping_date_id, :category_id, :situation_id, :image).merge(user_id: current_user.id)
  end
end
