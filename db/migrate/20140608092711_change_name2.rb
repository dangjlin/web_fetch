class ChangeName2 < ActiveRecord::Migration
  def change

  	rename_table :patent, :patents
  end
end
