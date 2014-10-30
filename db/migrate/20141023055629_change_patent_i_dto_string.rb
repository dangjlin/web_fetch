class ChangePatentIDtoString < ActiveRecord::Migration
  def self.up
    change_column :articles, :patent_id, :string
  end

  def self.down
    change_column :articles, :patent_id, :integer
  end
  
  
end
