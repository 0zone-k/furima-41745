FactoryBot.define do
  factory :order_address do
      post_cord       { '111-1111' }
      prefecture_id   { 2 }
      city            { '立川市' }
      banchi          { '1-1' }
      apt_name        { '' }
      tel_num         { '11111111111' }
      token           { '111111111111'}
  end

end