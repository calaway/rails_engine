class ApiController < ActionController::API
  def format_params(params)
    if params[:unit_price]
      params[:unit_price] = format_unit_price(params[:unit_price])
      params
    else
      params
    end
  end

  def format_unit_price(unit_price)
    unit_price.tr(".","")
  end
end
