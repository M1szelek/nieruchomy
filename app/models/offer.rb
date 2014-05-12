class Offer < ActiveRecord::Base
	belongs_to :user
  	default_scope -> { order('created_at DESC') }
  	validates :title, presence: true, length: { maximum: 64 }
  	validates :description, presence: true, length: { maximum: 1024 }
  	validates :user_id, presence: true
end
