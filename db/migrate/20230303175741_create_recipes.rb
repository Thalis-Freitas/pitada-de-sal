class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time
      t.integer :portions
      t.string :ingredients, array: true, default: []
      t.string :instructions, array: true, default: []
      t.date :post_date
      t.string :hints, array: true, default: []

      t.timestamps
    end
  end
end
