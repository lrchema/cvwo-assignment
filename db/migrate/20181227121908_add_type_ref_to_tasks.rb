class AddTypeRefToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :type, foreign_key: true
  end
end
