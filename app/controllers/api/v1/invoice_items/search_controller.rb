class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

  def index
    render json: InvoiceItem.where(invoice_item_params)
  end

  def random
    render json: InvoiceItem.random
  end

private
  def invoice_item_params
    strong_params = params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
    format_params(strong_params)
  end
end
