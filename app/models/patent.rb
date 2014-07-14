class Patent < ActiveRecord::Base

	extend FriendlyId
	friendly_id :apply_no, use: :slugged 
	validates(:apply_no, presence: true)

end
