class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :start
      t.date :due_date
      t.date :end_date
      t.text :status
      t.text :priority
      t.text :type

      t.timestamps
    end
  end
end
