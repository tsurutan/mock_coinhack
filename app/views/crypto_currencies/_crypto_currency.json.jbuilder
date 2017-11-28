json.extract! crypto_currency, :id, :name, :overview, :description, :symbol, :purchasable_currency, :released_at, :white_paper, :blog, :fund_raised_amount, :initial_price, :platform, :token_upper_limit, :token_sale_supply_amount, :key_name, :created_at, :updated_at
json.url crypto_currency_url(crypto_currency, format: :json)
