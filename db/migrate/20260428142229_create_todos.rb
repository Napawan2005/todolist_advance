class CreateTodos < ActiveRecord::Migration[8.1]
  def change
    create_table :todos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :status
      t.string :google_event_id
      t.boolean :reminder_sent

      t.timestamps
    end
    add_index :todos, [:user_id, :status]
    add_index :todos, :due_date
    #Ex:- add_index("admin_users", "username")
  end
end
