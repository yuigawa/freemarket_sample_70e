# require 'rails_helper'
# describe Profile do
#   describe '#create' do
#     it "is invalid without a first_name" do
#      profile = Profile.new(family_name: "de", first_name: "", family_name_kana: "mk", first_name_kana: "aa",birth_year: "2015", birth_month: "7", birth_day: "15")
#      profile.valid?
#      expect(profile.errors[:family_name]).to include("can't be blank")
#     end
#   end
# end