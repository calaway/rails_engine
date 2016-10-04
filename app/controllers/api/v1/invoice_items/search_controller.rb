class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    if params[:item_id]
      render json: InvoiceItem.find_by(item_id: params[:item_id])
    elsif params[:invoice_id]
      render json: InvoiceItem.find_by(invoice_id: params[:invoice_id])
    elsif params[:quantity]
      render json: InvoiceItem.find_by(quantity: params[:quantity])
    elsif params[:unit_price]
      render json: InvoiceItem.find_by(unit_price: params[:unit_price])
    end
  end
end
