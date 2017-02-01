class Api::V1::Invoices::InvoiceItemsController < ApiController
  def index
    invoice = Invoice.find(params[:id])
    render json: invoice.invoice_items
  end
end
