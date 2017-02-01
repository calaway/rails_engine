class Api::V1::Merchants::ItemsController < ApiController
  def index
    merchant = Merchant.find(params[:id])
    render json: merchant.items
  end
end
