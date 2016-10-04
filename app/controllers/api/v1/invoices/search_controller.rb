class Api::V1::Invoices::SearchController < ApplicationController
  def show
    search_key = params.keys.first.to_sym
    search_value = params.values.first
    render json: Invoice.find_by(:"#{search_key}" => search_value)
    # if params[:customer_id]
    #   render json: Invoice.find_by(customer_id: params[:customer_id])
    # elsif params[:merchant_id]
    #   render json: Invoice.find_by(merchant_id: params[:merchant_id])
    # end
  end

  def index
    search_key = params.keys.first.to_sym
    search_value = params.values.first
    render json: Invoice.where(:"#{search_key}" => search_value)
  end
end
