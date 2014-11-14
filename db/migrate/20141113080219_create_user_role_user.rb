class CreateUserRoleUser < ActiveRecord::Migration
  def change
    create_table :user_role_users do |t|
      t.references :user
      t.references :user_role

      t.timestamps
    end
  end
end
