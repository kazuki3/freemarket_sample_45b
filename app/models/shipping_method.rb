class ShippingMethod < ApplicationRecord
  scope :seller, -> {where(postage_id: 1)}
  scope :buyer , -> {where(postage_id: 2)}
end
