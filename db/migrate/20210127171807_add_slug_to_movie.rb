class AddSlugToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :slug, :string
    add_index :movies, :slug, unique: true
  end
end
