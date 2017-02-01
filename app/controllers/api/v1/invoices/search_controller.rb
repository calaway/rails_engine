class Api::V1::Invoices::SearchController < ApiController
  def show
    render json: Invoice.find_by(invoice_params)
  end

  def index
    render json: Invoice.where(invoice_params)
  end

  def random
    render json: Invoice.random
  end

  private
  def invoice_params
    params.permit(:id, :status, :customer_id, :merchant_id, :created_at, :updated_at)
  end
end
