class Api::V1::Merchants::TopByItemsController < ApiController
  def index
    render json: Merchant.top_item_merchants(params[:quantity])
  end
end
