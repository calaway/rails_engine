class Api::V1::Merchants::SearchController < ApplicationController
  def show
    search_key = merchant_params.keys.first
    search_value = merchant_params.values.first
    render json: Merchant.find_by("#{search_key} = ?", search_value)
  end

  def index
    search_key = merchant_params.keys.first
    search_value = merchant_params.values.first
    render json: Merchant.where("#{search_key} = ?", search_value)
  end

  private
  def merchant_params
    params.permit(:id,	:name,	:created_at,	:updated_at)
  end
end
