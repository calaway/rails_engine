class Api::V1::Invoices::ItemsController < ApiController
  def index
    invoice = Invoice.find(params[:id])
    render json: invoice.items
  end
end
