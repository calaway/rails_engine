class Api::V1::CustomerTransactionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    render json: customer.transactions
  end
end
