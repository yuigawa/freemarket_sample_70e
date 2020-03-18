require 'rails_helper'
describe Item do
  describe '#create' do
  it "is invalid without name" do
    item = build(:item, name: "")
    item.valid?
    expect(item.errors[:name]).to include("は1文字以上で入力してください")
  end

  it "is invalid with a name that has more than 41 characters" do
    item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    item.valid?
    expect(item.errors[:name]).to include("は40文字以内で入力してください")
  end

  it "is valid with a name that has less than 40 characters" do
    item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    binding.pry
    item.item_images.build(attributes_for(:item_image))
    
    # item.item_images.build(:item_image)
    # binding.pry
    expect(item).to be_valid
  end

  it "is invalid without category_id" do
    item = build(:item, category_id: "")
    item.valid?
    expect(item.errors[:category_id]).to include("を入力してください")
  end

  end
  
end
