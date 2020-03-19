class ItemsController < ApplicationController
  before_action :redirect_to_log_in, only: [:new, :create]
  before_action :set_info, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
    @item.item_images.new
  end
    
   # 以下全て、formatはjsonのみ
   # 親カテゴリーが選択された後に動くアクション
  def get_category_children
      #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
      @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

   # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
      @category_grandchildren = Category.find("#{params[:child_id]}").children
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
    render layout: 'application'
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
    
    
  end


  def destroy
    if @item.destroy
      redirect_to root_path
    else
      alert('削除できませんでした')
    end
  end

  private
  def redirect_to_log_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :item_description, :category_id, :brand_id, :size, :item_condition, :postage_type, :postage_payer, :prefecture_code, :estimated_shipping_date, :price, item_images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id, trading_status:"出品中")
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
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      hash = {}
      hash[:id] = parent.id
      hash[:name] = parent.name
      @category_parent_array << hash
    end
  end

  def registered_image_params
    params.require(:registered_images_ids).permit({ids: []})
  end

  def new_image_params
    params.require(:new_images).permit({images: []})
  end

  def set_item
    @item = Item.find(params[:id])
  end

end