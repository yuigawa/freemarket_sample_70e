require 'rails_helper'
describe Item do
  describe '#create' do
  it "is invalid without category_id" do
    item = Item.new(name: "", item_description: "TEST", category_id: "", brand_id: 1, size: "TEST", item_condition: "TEST", postage_type: "TEST", postage_payer: "TEST", prefecture_code: "TEST", estimated_shipping_date: "TEST", price: 300, item_images_attributes: [src: "image.png"] )
    item.valid?
    expect(item.errors[:category_id]).to include("can't be blank")
  end

  end
  
end
