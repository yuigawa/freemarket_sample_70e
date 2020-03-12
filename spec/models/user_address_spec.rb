describe Profile do
  describe '#create' do
    # 1. user_addressのカラムの中がが存在すれば登録できること
    it "is valid with a post_code, prefecture_code, city, house_number, building_name" do
      user_address = build(:user_address)
      expect(user_address).to be_valid
    end

    # 2. post_codeが空では登録できないこと
    it "is invalid without a post_code" do
      user_address= build(:user_address, post_code: nil)
      user_address.valid?
      expect(user_address.errors[:post_code]).to include("can't be blank")
    end

    # 3. prefecture_codeが空では登録できないこと
    it "is invalid without a prefecture_code" do
      user_address= build(:user_address, prefecture_code: nil)
      user_address.valid?
      expect(user_address.errors[:prefecture_code]).to include("can't be blank")
    end

    # 4. cityが空では登録できないこと
    it "is invalid without a city" do
      user_address= build(:user_address, city: nil)
      user_address.valid?
      expect(user_address.errors[:city]).to include("can't be blank")
    end

     # 5. house_numberが空では登録できないこと
     it "is invalid without a house_number" do
      user_address= build(:user_address, house_number: nil)
      user_address.valid?
      expect(user_address.errors[:house_number]).to include("can't be blank")
    end

    # 6. building_nameが空では登録できないこと
    it "is invalid without a building_name" do
      user_address= build(:user_address, building_name: nil)
      user_address.valid?
      expect(user_address.errors[:building_name]).to include("can't be blank")
    end

  end
end
  