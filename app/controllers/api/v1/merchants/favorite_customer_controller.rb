class Api::V1::Merchants::FavoriteCustomerController < ApiController
  def show
    merchant = Merchant.find(params[:id])
    render json: merchant.favorite_customer
  end
end
