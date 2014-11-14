class UserRoleUsersController < ApplicationController
  respond_to :html
  before_filter :ensure_admin, only: [:new, :destroy, :create]

  def new
    @user_role = UserRole.find(params[:user_role_id])
    @user_role_user = @user_role.user_role_users.new

    set_users
    respond_with(@user_role_user)
  end

  def create
    @user_role_user = UserRoleUser.where(params[:user_role_user]).first_or_create

    if @user_role_user
      flash[:notice] = 'UserRoleUser was successfully created.'
      respond_with(@user_role_user.user_role, location: @user_role_user.user_role)
    else
      set_users
      respond_with(@user_role_user)
    end
  end

  def destroy
    @user_role_user = UserRoleUser.find(params[:id])
    @user_role_user.destroy

    redirect_to user_role_path(@user_role_user.user_role_id), notice: 'UserRoleUser was successfully deleted.'
  end

  private
  def set_users
    @users = User.all.map {|user| [user.login, user.id] }
  end
end
