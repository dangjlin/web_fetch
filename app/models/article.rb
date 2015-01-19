class Article < ActiveRecord::Base
  belongs_to :patent, dependent: :destroy
  
  
end
