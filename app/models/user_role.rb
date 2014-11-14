class UserRole < ActiveRecord::Base
  has_many :user_role_users, dependent: :destroy
  has_many :users, through: :user_role_users
  has_many :user_role_projects, dependent: :destroy
  has_many :projects, through: :user_role_projects
end
