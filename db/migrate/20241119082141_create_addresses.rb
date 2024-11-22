class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :post_cord,null: false
      t.integer :prefecture_id,null: false
      t.string :city,null: false
      t.string :banchi,null: false
      t.string :apt_name
      t.string :tel_num,null: false,unique: true
      t.references :order, null: false , foreign_key: true 
      t.timestamps
    end
  end
end
