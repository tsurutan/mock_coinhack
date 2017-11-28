require 'test_helper'

class CryptoCurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crypto_currency = crypto_currencies(:one)
  end

  test "should get index" do
    get crypto_currencies_url
    assert_response :success
  end

  test "should get new" do
    get new_crypto_currency_url
    assert_response :success
  end

  test "should create crypto_currency" do
    assert_difference('CryptoCurrency.count') do
      post crypto_currencies_url, params: { crypto_currency: { blog: @crypto_currency.blog, description: @crypto_currency.description, fund_raised_amount: @crypto_currency.fund_raised_amount, initial_price: @crypto_currency.initial_price, key_name: @crypto_currency.key_name, name: @crypto_currency.name, overview: @crypto_currency.overview, platform: @crypto_currency.platform, purchasable_currency: @crypto_currency.purchasable_currency, released_at: @crypto_currency.released_at, symbol: @crypto_currency.symbol, token_sale_supply_amount: @crypto_currency.token_sale_supply_amount, token_upper_limit: @crypto_currency.token_upper_limit, white_paper: @crypto_currency.white_paper } }
    end

    assert_redirected_to crypto_currency_url(CryptoCurrency.last)
  end

  test "should show crypto_currency" do
    get crypto_currency_url(@crypto_currency)
    assert_response :success
  end

  test "should get edit" do
    get edit_crypto_currency_url(@crypto_currency)
    assert_response :success
  end

  test "should update crypto_currency" do
    patch crypto_currency_url(@crypto_currency), params: { crypto_currency: { blog: @crypto_currency.blog, description: @crypto_currency.description, fund_raised_amount: @crypto_currency.fund_raised_amount, initial_price: @crypto_currency.initial_price, key_name: @crypto_currency.key_name, name: @crypto_currency.name, overview: @crypto_currency.overview, platform: @crypto_currency.platform, purchasable_currency: @crypto_currency.purchasable_currency, released_at: @crypto_currency.released_at, symbol: @crypto_currency.symbol, token_sale_supply_amount: @crypto_currency.token_sale_supply_amount, token_upper_limit: @crypto_currency.token_upper_limit, white_paper: @crypto_currency.white_paper } }
    assert_redirected_to crypto_currency_url(@crypto_currency)
  end

  test "should destroy crypto_currency" do
    assert_difference('CryptoCurrency.count', -1) do
      delete crypto_currency_url(@crypto_currency)
    end

    assert_redirected_to crypto_currencies_url
  end
end
