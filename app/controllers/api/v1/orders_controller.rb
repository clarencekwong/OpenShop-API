class Api::V1::OrdersController < ApplicationController
  before_action :find_order, only: [:update, :show, :order, :destroy]
  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    render json: @order
  end

  def destroy
    @order.destroy
    render body: nil, status: :no_content
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      render json: @order, status: :accepted
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @order.update(order_params)
    if @order.save
      render json: @order, status: :accepted
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def order_params
    params.permit(:user_id, :status)
  end

  def find_order
    @order = Order.find(params[:id])
  end
end
