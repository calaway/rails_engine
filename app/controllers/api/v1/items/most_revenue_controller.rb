class Api::V1::Items::MostRevenueController < ApiController
  def index
    # require "pry"; binding.pry
    # Item.joins(:invoice_items).joins("INNER JOIN transactions ON transactions.invoice_id = invoice_items.invoice_id").where("transactions.result = 'success'").group("items.id").order("sum(invoice_items.quantity * invoice_items.unit_price) desc").limit(1)
    # require "pry"; binding.pry
    render json: Item.most_revenue(params[:quantity])
  end
end
