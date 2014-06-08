class Patent < ActiveRecord::Base

validates(:apply_no, presence: true)


end
