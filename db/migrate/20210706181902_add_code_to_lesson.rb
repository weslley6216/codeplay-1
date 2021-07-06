class AddCodeToLesson < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :code, :string
    add_index :lessons, :code, unique: true
  end
end
