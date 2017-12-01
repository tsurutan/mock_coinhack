class CryptoCurrenciesController < InheritedResources::Base

  def show
    @crypto_currency = CryptoCurrency.friendly.find(params[:id])
    @crypto_currencies = CryptoCurrency.all
    gon.crypto_currency_id = @crypto_currency.id
  end

  private

    def crypto_currency_params
      params.require(:crypto_currency).permit(:name, :overview, :description, :symbol, :purchasable_currency, :released_at, :white_paper, :blog, :fund_raised_amount, :initial_price, :platform, :token_upper_limit, :token_sale_supply_amount, :key_name)
    end
end

