class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
      t.references :user, index: true, foreign_key: true
    end
  end
end
