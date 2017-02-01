class Api::V1::Transactions::InvoicesController < ApiController
  def show
    transaction = Transaction.find(params[:id])
    render json: transaction.invoice
  end
end
