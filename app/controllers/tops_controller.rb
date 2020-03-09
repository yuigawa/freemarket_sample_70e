class TopsController < ApplicationController
  def index
    @items = Item.order('created_at DESC').limit(3)
  end
end
