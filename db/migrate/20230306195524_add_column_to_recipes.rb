class AddColumnToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :recipes, :string
    add_reference :recipes, :category, foreign_key: true
  end
end
