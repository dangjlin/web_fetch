class CreateKeywordas < ActiveRecord::Migration
  def change
    create_table :keywordas do |t|
      t.string :keyworda
      t.integer :priority

      t.timestamps
    end
  end
end
