class UserRoleProject < ActiveRecord::Base
  belongs_to :user_role
  belongs_to :project
end
