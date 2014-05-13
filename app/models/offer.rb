class Offer < ActiveRecord::Base
	belongs_to :user
	has_many :comments
  	default_scope -> { order('created_at DESC') }
  	validates :title, presence: true, length: { maximum: 64 }
  	validates :description, presence: true, length: { maximum: 1024 }
  	validates :user_id, presence: true
end
