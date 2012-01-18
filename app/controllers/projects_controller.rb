class ProjectsController < ApplicationController
  respond_to :html
  
  def index
    @projects = current_user.projects.page(params[:page]).per(10)
  end
  
  def show
    @project = current_user.projects.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project].merge({
      user: current_user
    }))
    
    if @project.save
      redirect_to project_posts_path(@project), notice: "Project was successfully created."; return
    end
    
    respond_with(@project)
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to project_posts_path(@project), notice: "Project was successfully updated."; return
    end
    
    respond_with(@project)
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to root_path, notice: "Project was successfully removed."
  end
end
