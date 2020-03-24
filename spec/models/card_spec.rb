require 'rails_helper'

#クレカが登録してあれば購入できる
describe  User do
  describe '#card' do

    it "is invalid without a customer_id" do
      card = build(:user, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

    it "is invalid without an card_id" do
      card = build(:user, card_id: "")
      card.valid?
      expect(user.errors[:card_id]).to include("can't be blank")
    end

  end
end