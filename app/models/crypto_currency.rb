class CryptoCurrency < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :relation_exchange_crypto_currencies
  has_many :exchanges, through: :relation_exchange_crypto_currencies
  accepts_nested_attributes_for :relation_exchange_crypto_currencies
  has_attached_file :icon_image,
                    :styles      => { :medium => "400x400>", :thumb => "100x100>" },
                    :path => ":rails_root/public/system/cryptocurrency_icon/:id/:style/:filename",
                    :url => "/system/cryptocurrency_icon/:id/:style/:filename"

  validates_attachment :icon_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }


  def exchanges
    Exchange.find(relation_exchange_crypto_currencies.map {|relation| relation.exchange_id})
  end
end
