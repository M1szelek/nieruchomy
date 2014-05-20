class Offer < ActiveRecord::Base
	belongs_to :user
	has_many :comments
  	default_scope -> { order('created_at DESC') }
  	validates :title, presence: true, length: { maximum: 64 }
  	validates :description, presence: true, length: { maximum: 1024 }
  	validates :user_id, presence: true
  	validates :metrage, presence: true, numericality: { only_integer: true }
  	validates :roomcount, presence: true, numericality: { only_integer: true }
  	validates :price, presence: true, numericality: { only_integer: true }
end
