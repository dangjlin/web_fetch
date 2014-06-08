class CreatePatents < ActiveRecord::Migration
  def change
    create_table :patents do |t|
      t.string :apply_no
      t.text :patent_scope

      t.timestamps
    end
  end
end
