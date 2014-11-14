class UserRoleProjectsController < ApplicationController
  respond_to :html
  before_filter :ensure_admin, only: [:new, :destroy, :create]

  def new
    @user_role = UserRole.find(params[:user_role_id])
    @user_role_project = @user_role.user_role_projects.new
    set_projects

    respond_with(@user_role_project)
  end

  def create
    @user_role_project = UserRoleProject.where(params[:user_role_project]).first_or_create

    if @user_role_project
      flash[:notice] = 'UserRoleProject was successfully created.'
      respond_with(@user_role_project.user_role, location: @user_role_project.user_role)
    else
      set_projects
      respond_with(@user_role_project)
    end
  end

  def destroy
    @user_role_project = UserRoleProject.find(params[:id])
    @user_role_project.destroy

    redirect_to user_role_path(@user_role_project.user_role_id), notice: 'UserRoleProject was successfully deleted.'
  end

  private
  def set_projects
    @projects = Project.scoped.map {|project| [project.name, project.id] }
  end
end
