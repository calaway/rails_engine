class Api::V1::Invoices::MerchantsController < ApiController
  def show
    invoice = Invoice.find(params[:id])
    render json: invoice.merchant
  end
end
