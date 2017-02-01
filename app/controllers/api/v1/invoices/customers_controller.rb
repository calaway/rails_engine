class Api::V1::Invoices::CustomersController < ApiController
  def show
    invoice = Invoice.find(params[:id])
    render json: invoice.customer
  end
end
