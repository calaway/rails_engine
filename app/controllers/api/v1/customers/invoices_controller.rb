class Api::V1::Customers::InvoicesController < ApiController
  def index
    customer = Customer.find(params[:id])
    render json: customer.invoices
  end
end
