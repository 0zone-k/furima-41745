require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user: @user)
      sleep 0.1
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

    describe '商品購入機能' do
      context '購入できる場合' do
        it 'post_cordとprefecture_id、cityとbanchi,tel_num,が存在すれば登録できる' do
          expect(@order_address).to be_valid
        end
        it '建物名が空でも登録できる' do
          @order_address.apt_name = ''
          expect(@order_address).to be_valid
        end
      end
      context '購入できない場合' do
        it '郵便番号が必須であること' do
          @order_address.post_cord = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include "Post cord can't be blank"
        end
        it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
          @order_address.post_cord = '１２３４５６７'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include "Post cord is invalid. Enter it as follows (e.g. 123-4567)"
        end
        it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
          @order_address.post_cord = '1234567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include "Post cord is invalid. Enter it as follows (e.g. 123-4567)"
        end
        it '都道府県が必須であること' do
          @order_address.prefecture_id = '1'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
        end
        it '市区町村が必須であること' do
          @order_address.city = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include "City can't be blank"
        end
        it '番地が必須であること' do
          @order_address.banchi = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include "Banchi can't be blank"
        end
        it '電話番号が必須であること' do
          @order_address.tel_num = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include "Tel num can't be blank"
        end
        it '電話番号は、10桁未満は保存できないこと' do
          @order_address.tel_num = '123456789'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include "Tel num is too short"
        end
        it '電話番号は、11桁以上は保存できないこと' do
          @order_address.tel_num = '123456789012'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Tel num is too long")
        end
        it '電話番号が半角数字以外では登録できない' do
          @order_address.tel_num = '１２３４５６７８９０'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Tel num is invalid. Input only number')
        end
          it 'tokenが空では登録できない' do
            @order_address.token = nil
            @order_address.valid?
            expect(@order_address.errors.full_messages).to include("Token can't be blank")
          end
          
      end
    end
  end
