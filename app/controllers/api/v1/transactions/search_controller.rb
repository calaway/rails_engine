class Api::V1::Transactions::SearchController < ApplicationController
  def show
    search_key = transaction_params.keys.first
    search_value = transaction_params.values.first
    render json: Transaction.find_by("#{search_key} = ?", search_value)
  end

  def index
    search_key = transaction_params.keys.first
    search_value = transaction_params.values.first
    render json: Transaction.where("#{search_key} = ?", search_value)
  end

  def random
    render json: Transaction.random
  end

  private
  def transaction_params
    params.permit(:id,
                  :invoice_id,
                  :credit_card_number,
                  :credit_card_expiration_date,
                  :result,
                  :created_at,
                  :updated_at)
  end
end
