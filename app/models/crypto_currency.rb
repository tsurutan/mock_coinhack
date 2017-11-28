class CryptoCurrency < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :exchanges, through: :relation_exchange_crypto_currencies
  has_many :relation_exchange_crypto_currencies
  accepts_nested_attributes_for :relation_exchange_crypto_currencies
  has_attached_file :icon_image,
                    :styles      => { :medium => "400x400>", :thumb => "100x100>" },
                    # 1つのモデルが複数の画像をもつ（has_many）場合、下記の指定が必要らしい
                    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                    :url => "/system/:attachment/:id/:style/:filename"

  validates_attachment :icon_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end
