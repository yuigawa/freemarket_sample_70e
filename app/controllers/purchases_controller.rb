class PurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id]) 
    @user = User.find(current_user.id)
    #Cardのデータpayjpに送り情報を取り出します
    @card = Card.where(user_id: current_user.id).first
    if @card
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
  def create
    item = Item.find(params[:item_id])
    item.update(trading_status: "購入済", buyer_id: current_user.id)
  end

end
