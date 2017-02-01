class Api::V1::Merchants::InvoicesController < ApiController
  def index
    merchant = Merchant.find(params[:id])
    render json: merchant.invoices
  end
end
