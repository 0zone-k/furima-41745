class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :order_address_new, only: [:index, :new]
  before_action :move_to_root_path, only: [:index, :new, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index,:create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end


  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path(@order_address)
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:post_cord, :prefecture_id, :city, :banchi, :apt_name, :tel_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_address_new
    @order_address = OrderAddress.new
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:Item.find(params[:item_id]).price,  
        card: order_address_params[:token],   
        currency: 'jpy'                 
      )
  end

  def move_to_root_path
    order = Order.find_by(item_id: @item)
      if  order.present?
  
        redirect_to root_path
      end
  end

end