class Api::V1::Items::InvoiceItemsController < ApiController
  def index
    item = Item.find(params[:id])
    render json: item.invoice_items
  end
end
