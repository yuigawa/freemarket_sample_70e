class TopsController < ApplicationController

  def index
    @items = Item.where(trading_status: '出品中').order('created_at DESC').limit(3)

  end

end
