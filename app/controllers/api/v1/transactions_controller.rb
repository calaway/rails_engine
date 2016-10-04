class Api::V1::TransactionsController < ApplicationController
  def index
    render json: Transactions.all
  end
end
