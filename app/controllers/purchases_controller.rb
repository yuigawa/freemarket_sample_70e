class PurchasesController < ApplicationController
  require 'payjp'
  before_action:set_item

  def new
    #Cardのデータpayjpに送り情報を取り出します
    @card = Card.where(user_id: current_user.id).first
    if @card
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
    # redirect_to :action => 'pay'
  end


  def create
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => 13500, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
    )
    unless @item.update(trading_status: "購入済", buyer_id: current_user.id)
      render :new
    end
  end

  # def pay
  #   card = Card.where(user_id: current_user.id).first
  #   Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  #   Payjp::Charge.create(
  #   :amount => 13500, #支払金額を入力（itemテーブル等に紐づけても良い）
  #   :customer => card.customer_id, #顧客ID
  #   :currency => 'jpy', #日本円
  # )
  # redirect_to action: 'done' #完了画面に移動
  # end

  private
  def set_item
    @item = Item.find(params[:item_id]) 
  end
end