class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string   :patent_id
      t.integer  :sentence_id
      t.string   :sentence
      t.integer  :parent_id
      t.integer  :child_id
      t.integer  :lft_node
      t.integer  :rgt_node
      t.integer  :level
      t.timestamps
    end
  end
end
