class CreateKeywordbs < ActiveRecord::Migration
  def change
    create_table :keywordbs do |t|
      t.string :keywordb
      t.integer :priority

      t.timestamps
    end
  end
end
