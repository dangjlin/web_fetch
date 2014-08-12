class CreateSplitwords < ActiveRecord::Migration
  def change
    create_table :splitwords do |t|
      t.string :keyworda
      t.string :keywordb

      t.timestamps
    end
  end
end
