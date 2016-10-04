class Api::V1::Invoices::SearchController < ApplicationController
  def show
    search_key = invoice_params.keys.first
    search_value = invoice_params.values.first
    if search_key == "status"
      render json: Invoice.find_by("lower(#{search_key}) = ?", search_value.downcase)
    else
      render json: Invoice.find_by("#{search_key} = ?", search_value)
    end
    # if params[:customer_id]
    #   render json: Invoice.find_by(customer_id: params[:customer_id])
    # elsif params[:merchant_id]
    #   render json: Invoice.find_by(merchant_id: params[:merchant_id])
    # end
  end

  def index
    search_key = params.keys.first
    search_value = params.values.first
    if search_key == "status"
      render json: Invoice.where("lower(#{search_key}) = ?", search_value.downcase)
    else
      render json: Invoice.where("#{search_key} = ?", search_value)
    end
  end

private
  def invoice_params
    params.permit(:id, :status, :customer_id, :merchant_id)
  end
end
