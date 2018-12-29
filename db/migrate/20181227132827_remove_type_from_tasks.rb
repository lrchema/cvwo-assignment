class RemoveTypeFromTasks < ActiveRecord::Migration[5.2]
  def change
  	remove_column :tasks, :type
  end
end
