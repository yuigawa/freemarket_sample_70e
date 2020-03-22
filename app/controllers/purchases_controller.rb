class PurchasesController < ApplicationController
  require 'payjp'
  before_action :set_item, only: [:new, :create]

  def new
    #Cardのデータpayjpに送り情報を取り出します
    @card = Card.where(user_id: current_user.id).first
    if @card
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def create
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    unless @item.update(trading_status: "購入済", buyer_id: current_user.id)
      render :new
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id]) 
  end
end