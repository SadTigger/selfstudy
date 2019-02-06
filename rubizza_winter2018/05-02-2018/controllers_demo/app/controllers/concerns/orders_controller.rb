class OrdersController < ApplicationController
  def index
    render plain: "All orders."
  end

  def show
    # render plain: "Some specific order."
    render plain: "Order id = #{params[:id]}"
  end
end
