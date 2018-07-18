class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :todos, [:user_id, :created_at]
  end
end
