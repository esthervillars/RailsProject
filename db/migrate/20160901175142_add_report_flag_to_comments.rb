class AddReportFlagToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :report, :boolean, default: false, null: false
  end
end
