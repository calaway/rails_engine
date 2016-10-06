class Api::V1::Transactions::InvoicesController < ApplicationController
  def show
    transaction = Transaction.find(params[:id])
    render json: transaction.invoice
  end
end
