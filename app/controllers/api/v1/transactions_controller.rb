class Api::V1::TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render json: @transaction, status: :accepted
    else
      render json: { errors: @transaction.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def transaction_params
    params.permit(:user_id, :total)
  end
end
