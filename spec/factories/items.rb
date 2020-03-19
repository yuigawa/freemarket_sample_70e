FactoryBot.define do
  factory :item do
    name              {"tanaka"}
    item_description  {"これはテストです"}
    category_id       {"1"}
    brand_id          {"1"}
    size              {"100x100"}
    item_condition    {"良好"}
    postage_type      {"ゆうパック"}
    postage_payer     {"購入者負担"}
    prefecture_code   {"北海道"}
    estimated_shipping_date {"即日"}
    price             {"000"}
    trading_status    {"出品中"}
    association :user
    # association :item_image
    # item_images_attributes { attributes_for(:item_image) }  
    factory :item_image do
      src {"image.png"}
      # item_id {"1"}
    end
  end
end