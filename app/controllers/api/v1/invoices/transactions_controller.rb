class Api::V1::Invoices::TransactionsController < ApiController
  def index
    invoice = Invoice.find(params[:id])
    render json: invoice.transactions
  end
end
