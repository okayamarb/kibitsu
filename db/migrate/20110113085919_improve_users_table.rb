class ImproveUsersTable < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.remove_index :disabled
      t.rename :disabled, :disabled_at
      #t.change :admin, :boolean, :default => false
      t.index :disabled_at
    end
    remove_column :users, :admin
    add_column :users, :admin, :boolean, :default => false
  end

  def self.down
    change_table :users do |t|
      t.remove_index :disabled_at
      t.rename :disabled_at, :disabled
      #t.change :admin, :integer, :default => 0
      t.index :disabled
    end
    remove_column :users, :admin
    add_column :users, :admin, :integer, :default => 0
  end
end
