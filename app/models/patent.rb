class Patent < ActiveRecord::Base
  
  has_many :articles
 
	extend FriendlyId
	friendly_id :apply_no, use: :slugged 
	validates(:apply_no, presence: true)
  
  
end
 
