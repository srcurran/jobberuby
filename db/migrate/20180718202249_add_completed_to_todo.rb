class AddCompletedToTodo < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :completed, :string
  end
end
