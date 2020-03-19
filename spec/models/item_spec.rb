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

    expect(item).to be_valid
  end

  it "is invalid without item_description" do
    item = build(:item, item_description: "")
    item.valid?
    expect(item.errors[:item_description]).to include("は1文字以上で入力してください")
  end

  it "is invalid with a item_description that more than 1001 characters" do
    word = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLM"
    item = build(:item, item_description: word)
    item.valid?
    expect(item.errors[:item_description]).to include("は1000文字以内で入力してください")
  end

  it "is valid with a item_description that less than 1000 characters" do
    word = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKL"
    item = build(:item, item_description: word)
    expect(item).to be_valid
  end

  it "is invalid without category_id" do
    item = build(:item, category_id: "")
    item.valid?
    expect(item.errors[:category_id]).to include("を入力してください")
  end

  it "is invalid without size" do
    item = build(:item, size: "")
    item.valid?
    expect(item.errors[:size]).to include("を入力してください")
  end

  it "is invalid without item_condition" do
    item = build(:item, item_condition: "")
    item.valid?
    expect(item.errors[:item_condition]).to include("を入力してください")
  end

  it "is invalid without postage_type" do
    item = build(:item, postage_type: "")
    item.valid?
    expect(item.errors[:postage_type]).to include("を入力してください")
  end

  it "is invalid without postage_payer" do
    item = build(:item, postage_payer: "")
    item.valid?
    expect(item.errors[:postage_payer]).to include("を入力してください")
  end

  it "is invalid without prefecture_code" do
    item = build(:item, prefecture_code: "")
    item.valid?
    expect(item.errors[:prefecture_code]).to include("を入力してください")
  end
  it "is invalid without estimated_shipping_date" do
    item = build(:item, estimated_shipping_date: "")
    item.valid?
    expect(item.errors[:estimated_shipping_date]).to include("を入力してください")
  end

  it "is invalid without price" do
    item = build(:item, price: "")
    item.valid?
    expect(item.errors[:price]).to include("を入力してください")
  end

  it "is invalid without trading_status" do
    item = build(:item, trading_status: "")
    item.valid?
    expect(item.errors[:trading_status]).to include("を入力してください")
  end

  it "is invalid without item_images" do
    item = build(:item)
    item.item_images = []
    item.valid?
    expect(item.errors[:base]).to include("画像が1枚もアップロードされていません")
  end

  it "is valid without brand_id" do
    item = build(:item, brand_id: "")
    expect(item).to be_valid
  end

  end
  
end
