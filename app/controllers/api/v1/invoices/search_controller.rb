class Api::V1::Invoices::SearchController < ApplicationController
  def show
    search_key = invoice_params.keys.first
    search_value = invoice_params.values.first
    if search_key == "status"
      render json: Invoice.find_by("lower(#{search_key}) = ?", search_value.downcase)
    else
      render json: Invoice.find_by("#{search_key} = ?", search_value)
    end
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

  def random
    render json: Invoice.random
  end

private
  def invoice_params
    params.permit(:id, :status, :customer_id, :merchant_id)
  end
end
