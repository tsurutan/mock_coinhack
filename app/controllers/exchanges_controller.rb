class ExchangesController < ApplicationController

  def index
  end

  def show
    @exchange = Exchange.friendly.find(params[:id])
    @exchanges = Exchange.all
    gon.exchange_id = @exchange.id
  end
end
