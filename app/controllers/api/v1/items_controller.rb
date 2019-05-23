class Api::V1::ItemsController < ApplicationController
  before_action :find_item, only: [:update, :show]
  def index
    @items = Item.all
    render json: @items
  end

  def create
    current_item = Item.find_by({product_id: params[:product_id], order_id: params[:order_id]})
    if current_item
      @item = current_item
      @item.quantity += 1
    else
      @item = Item.new(item_params)
    end
    if @item.save
      render json: @item, status: :accepted
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      render json: @item, status: :accepted
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def item_params
    params.permit(:product_id, :order_id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
