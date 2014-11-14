class CreateUserRole < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.string :name
      t.string :memo

      t.timestamps
    end
  end
end
