class UserRolesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :ensure_admin, only: [:new, :edit, :destroy, :create, :update]

  def index
    @user_roles = UserRole.order(:name)
    respond_with(@user_roles)
  end

  def show
    @user_role = UserRole.find(params[:id])
    respond_with(@user_role)
  end

  def new
    @user_role = UserRole.new
    respond_with(@user_role)
  end

  def edit
    @user_role = UserRole.find(params[:id])
    respond_with(@user_role)
  end

  def create
    @user_role = UserRole.unscoped.where(params[:user_role]).first_or_create

    if @user_role
      flash[:notice] = 'UserRole was successfully created.'
      respond_with(@user_role, location: @user_role)
    else
      respond_with(@user_role)
    end
  end

  def update
    @user_role = UserRole.find(params[:id])

    if @user_role.update_attributes(params[:user_role])
      flash[:notice] = 'UserRole was successfully updated.'
      respond_with(@user_role, location: @user_role)
    else
      respond_with(@user_role)
    end
  end

  def destroy
    @user_role = UserRole.find(params[:id])
    @user_role.destroy

    redirect_to user_roles_path, notice: 'UserRole was successfully deleted.'
  end
end
