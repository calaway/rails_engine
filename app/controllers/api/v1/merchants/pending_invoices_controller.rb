class Api::V1::Merchants::PendingInvoicesController < ApiController
  def index
    render json: Merchant.find(params[:id]).customers_with_pending_invoices
  end
end
