class Keywordb < ActiveRecord::Base
  
  validates :priority, numericality: { only_integer: true }
end
