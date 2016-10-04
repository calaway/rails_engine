class Api::V1::Items::SearchController < ApplicationController
  def show
    if params[:name]
      render json: Item.find_by(name: params[:name])
    end
  end
end
