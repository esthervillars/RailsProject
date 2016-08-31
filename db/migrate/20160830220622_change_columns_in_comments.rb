class ChangeColumnsInComments < ActiveRecord::Migration
  def change
  	add_column :comments, :commentable_id, :integer
  	add_column :comments, :commentable_type, :string
  	
  	remove_reference( :comments, :user, index: true, foreign_key: true)
  	remove_reference( :comments, :product, index: true, foreign_key: true)
		remove_reference( :comments, :post, index: true, foreign_key: true)
  	
  	add_index :comments, [:commentable_id, :commentable_type]
  end

  
end
