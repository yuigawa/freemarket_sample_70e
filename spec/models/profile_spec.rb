require 'rails_helper'

describe Profile do
  describe '#create' do
    # 1. profileのカラムの中がが存在すれば登録できること
    it "is valid with a family_name, first_name, family_name_kana, first_name_kana, birth_year, birth_month, birth_day" do
      profile = build(:profile)
      expect(profile).to be_valid
    end

    # 2. family_nameが空では登録できないこと
    it "is invalid without a family_name" do
      profile = build(:profile, family_name: nil)
      profile.valid?
      expect(profile.errors[:family_name]).to include("can't be blank")
    end

    # 3. first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      profile = build(:profile, first_name: nil)
      profile.valid?
      expect(profile.errors[:first_name]).to include("can't be blank")
    end

    # 4. family_name_kanaが空では登録できないこと
    it "is invalid without a family_name" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("can't be blank")
    end

     # 5. first_name_kanaが空では登録できないこと
     it "is invalid without a first_name" do
      profile = build(:profile, first_name_kana: nil)
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("can't be blank")
    end

     # 6. birth_yearが空では登録できないこと
     it "is invalid without a birth_year" do
      profile = build(:profile, birth_year: nil)
      profile.valid?
      expect(profile.errors[:birth_year]).to include("can't be blank")
    end


     # 7. birth_monthが空では登録できないこと
     it "is invalid without a birth_month" do
      profile = build(:profile, birth_month: nil)
      profile.valid?
      expect(profile.errors[:birth_month]).to include("can't be blank")
    end

    # 8. birth_dayが空では登録できないこと
    it "is invalid without a  birth_day" do
      profile = build(:profile, birth_day: nil)
      profile.valid?
      expect(profile.errors[:birth_day]).to include("can't be blank")
    end
  end
end