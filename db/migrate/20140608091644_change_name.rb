class ChangeName < ActiveRecord::Migration
  def change
  
  rename_table :patents, :patent

  end
end
