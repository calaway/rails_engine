class Api::V1::TransactionInvoicesController < ApplicationController
  def show
    transaction = Transaction.find(params[:transaction_id])
    render json: transaction.invoice
  end
end
