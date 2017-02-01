class Api::V1::InvoiceItems::ItemsController < ApiController
  def show
    render json: InvoiceItem.find(params[:id]).item
  end
end
