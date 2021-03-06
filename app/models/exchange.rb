class Exchange < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :relation_exchange_crypto_currencies
  has_many :crypto_currencies, through: :relation_exchange_crypto_currencies
  has_many :ticker

  has_attached_file :icon_image,
                    :styles      => { :medium => "400x400>", :thumb => "100x100>" },
                    :path => ":rails_root/public/system/exchange_icon/:id/:style/:filename",
                    :url => "/system/:attachment/:id/:style/:filename"

  validates_attachment :icon_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  def tickers
    Ticker.find(ticker.ids)
  end
end
