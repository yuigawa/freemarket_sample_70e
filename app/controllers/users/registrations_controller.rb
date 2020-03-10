# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
    @profile = @user.build_profile
    @user_address = @user.build_user_address
    @prefectures = Prefecture.all
    @birth_year = BirthYear.all
    @birth_mounth = BirthMounth.all
    @birth_day = BirthDay.all
  end
end
