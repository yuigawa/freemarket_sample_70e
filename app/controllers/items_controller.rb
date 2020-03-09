class ItemsController < ApplicationController
  def index
    render :show
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end
end
