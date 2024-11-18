class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :find_item, only: [:show, :edit, :update]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
    # @order = Order.find_by(item_id: @item.id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == @item.user_id
      item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :introduction, :user, :price, :prefecture_id, :postage_id,
                                 :shopping_date_id, :category_id, :situation_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    find_item
    unless current_user.id == @item.user_id

    redirect_to root_path
    end
  end
  def find_item
    @item = Item.find(params[:id])
  end
  end