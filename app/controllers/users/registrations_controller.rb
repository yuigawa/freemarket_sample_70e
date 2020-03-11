# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_material, only: [:new, :create, :edit, :update]


  def new
    @user = User.new
    @profile = @user.build_profile
    @user_address = @user.build_user_address
  end

  def create
    user = User.new(configure_sign_up_params)
    if user.save
      redirect_to root_path 
    else
      redirect_to new_user_registration_path, alert: "エラーメッセージ"
    end
    logger.debug user.errors.inspect
  end

  private
  def set_material
    @prefectures = Prefecture.all
    @birth_year = BirthYear.all
    @birth_month = BirthMonth.all
    @birth_day = BirthDay.all
  end

  def configure_sign_up_params
    params.require(:user).permit(:nickname, :email, :password, profile_attributes: [:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :phone_number], user_address_attributes: [:post_code, :prefecture_code, :city, :house_number, :building_name])
  end


end
