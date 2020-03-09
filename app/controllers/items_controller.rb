class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
    @item.item_images.new
    @categories = Category.all
    @brands = Brand.all
    @prefectures = Prefecture.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :item_description, :category_id, :brand_id, :size, :item_condition, :postage_payer, :prefecture_code, :estimated_shipping_date, :price, item_images_attributes: [:src])
  end
end
