class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :height, :float
    add_column :users, :weight, :float

    add_index :users, [:age, :height, :weight]
  end
end
