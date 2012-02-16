class PostsController < ApplicationController
  respond_to :html, :pdf
  
  before_filter do
    @project = Project.
      for_user(current_user).
      joins(:posts).
      select("projects.*, SUM(HOUR(TIMEDIFF(posts.ended_at, posts.started_at))) as hours").
      find(params[:project_id])
  end
  
  def index
    time = Time.zone.now
    @posts = @project.posts.order("posts.created_at DESC")
    @week = Post.select("SUM(HOUR(TIMEDIFF(posts.ended_at, posts.started_at))) as hours").
      where(project_id: params[:project_id]).
      group("posts.project_id").
      where("posts.started_at BETWEEN ? and ?", time.beginning_of_week, time.end_of_week).first.try(:hours).to_i.round(1)
    @average = (@project.hours.to_f / ((time.to_f - @project.created_at.to_i) / (60 * 60 * 24 * 7))).round(1)
    
    unless params[:format] == "pdf"
      @posts = @posts.page(params[:page]).per(5)
    end
    
    respond_with(@posts) do |f|
      f.pdf do
        render ({
          pdf: "#{@project.to_param}-log.pdf", 
          template: "posts/index.pdf.erb", 
          layout: "pdf.html"
        })
      end
    end
  end
  
  def new
    @post = Post.new
  end

  def edit
    @post = @project.posts.find(params[:id])
  end

  def create
    @post = Post.new(params[:post].merge({
      project_id: params[:project_id]
    }))
    
    if @post.save
      redirect_to project_posts_path, notice: "Post was successfully created."; return
    end
    
    respond_with(@post)
  end

  def update
    @post = @project.posts.find(params[:id])
    
    if @post.update_attributes(params[:post])
      redirect_to project_posts_path, notice: "Post was successfully created."; return
    end    
    
    respond_with(@post)
  end

  def destroy
    @post = @project.posts.find(params[:id])
    @post.destroy
    redirect_to project_posts_path
  end
end
