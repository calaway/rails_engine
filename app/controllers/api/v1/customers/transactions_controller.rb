class Api::V1::Customers::TransactionsController < ApiController
  def index
    customer = Customer.find(params[:id])
    render json: customer.transactions
  end
end
