class Api::V1::Items::MerchantsController < ApiController
  def show
    item = Item.find(params[:id])
    render json: item.merchant
  end
end
