class RemoveFieldsInProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :colour
  	remove_column :products, :size
  end
end
