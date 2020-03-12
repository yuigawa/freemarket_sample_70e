class ItemsController < ApplicationController
  before_action :redirect_to_log_in, only: [:new, :create]
  before_action :set_info, only: [:new, :create, :edit, :update]

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.item_images.new if @item.item_images.empty?
      render :new
    end
  end

  def show
  end

  def edit
  end

  private
  def redirect_to_log_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :item_description, :category_id, :brand_id, :size, :item_condition, :postage_type, :postage_payer, :prefecture_code, :estimated_shipping_date, :price, item_images_attributes: [:src]).merge(user_id: current_user.id, trading_status:"出品中")
  end

  def set_info
    @categories = Category.all
    @brands = Brand.all
    @prefectures = Prefecture.all
    @sizes = ItemSize.all
    @conditions = Condition.all
    @postage_types = PostageTy.all
    @postage_pays = PostagePay.all
    @shipping_dates = ShippingDate.all
  end
end
