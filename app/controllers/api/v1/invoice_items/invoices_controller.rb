class Api::V1::InvoiceItems::InvoicesController < ApiController
  def show
    render json: InvoiceItem.find(params[:id]).invoice
  end
end
