class RelationExchangeCryptoCurrency < ApplicationRecord
  belongs_to :exchange
  belongs_to :crypto_currency
end
