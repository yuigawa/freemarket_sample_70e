FactoryBot.define do
  factory :item do
    id                {"1"}
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

    after(:build) do |item|
      item.item_images << build(:item_image, item_id: item)
    end

  end
end