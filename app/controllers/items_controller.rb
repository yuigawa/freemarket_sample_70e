class ItemsController < ApplicationController
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
      logger.debug @item.errors.inspect
      render new_item_path
    end
  end

  def show
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :item_description, :category_id, :brand_id, :size, :item_condition, :postage_payer, :prefecture_code, :estimated_shipping_date, :price, item_images_attributes: [:src]).merge(user_id: 1)
  end

  def set_info
    @categories = Category.all
    @brands = Brand.all
    @prefectures = Prefecture.all
  end
end
