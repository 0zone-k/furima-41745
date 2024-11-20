class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_cord, :prefecture_id, :city, :banchi, :apt_name, :tel_num

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/,message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :banchi
    validates :tel_num, format: { with: /\A\d{10,11}\z/,message: "is invalid. Input only number"}, 
    length: { in: 10..11, too_short: "is too short", too_long: "is too long" }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(order_id: order.id, post_cord: post_cord, prefecture_id: prefecture_id, city: city, banchi: banchi, apt_name: apt_name, tel_num: tel_num)
  end
end