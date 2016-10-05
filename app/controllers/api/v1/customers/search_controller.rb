class Api::V1::Customers::SearchController < ApplicationController
  def show
    search_key = customer_params.keys.first
    search_value = customer_params.values.first
    render json: Customer.find_by("#{search_key} = ?", search_value)
  end

  def index
    search_key = customer_params.keys.first
    search_value = customer_params.values.first
    render json: Customer.where("#{search_key} = ?", search_value)
  end

  def random
    render json: Customer.random
  end

  private
  def customer_params
    params.permit(:id,	:first_name,	:last_name,	:created_at,	:updated_at)
  end
end
