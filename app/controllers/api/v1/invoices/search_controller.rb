class Api::V1::Invoices::SearchController < ApplicationController
  def show
    if params[:customer_id]
      render json: Invoice.find_by(customer_id: params[:customer_id])
    elsif params[:merchant_id]
      render json: Invoice.find_by(merchant_id: params[:merchant_id])
    end
  end
end
