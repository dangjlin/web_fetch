class AddArticleTotaltoPatent < ActiveRecord::Migration
  def change
    add_column :patents, :article_total, :integer
  end
end
