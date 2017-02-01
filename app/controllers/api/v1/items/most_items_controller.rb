class Api::V1::Items::MostItemsController < ApiController
  def index
    render json: Item.most_items(params[:quantity])
  end
end
