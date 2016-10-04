class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    search_key = params.keys.first.to_sym
    search_value = params.values.first
    render json: InvoiceItem.find_by(:"#{search_key}" => search_value)
    # if params[:item_id]
    #   render json: InvoiceItem.find_by(item_id: params[:item_id])
    # elsif params[:invoice_id]
    #   render json: InvoiceItem.find_by(invoice_id: params[:invoice_id])
    # elsif params[:quantity]
    #   render json: InvoiceItem.find_by(quantity: params[:quantity])
    # elsif params[:unit_price]
    #   render json: InvoiceItem.find_by(unit_price: params[:unit_price])
    # end
  end
end
