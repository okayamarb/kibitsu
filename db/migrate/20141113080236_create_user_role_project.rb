class CreateUserRoleProject < ActiveRecord::Migration
  def change
    create_table :user_role_projects do |t|
      t.references :project
      t.references :user_role

      t.timestamps
    end
  end
end
