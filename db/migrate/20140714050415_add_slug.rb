class AddSlug < ActiveRecord::Migration
  def change
  	add_column :patents, :slug, :string

  end
end
