class PostsController < ApplicationController
  respond_to :html, :pdf
  
  before_filter do
    @project = current_user.
      projects.
      joins(:posts).
      select("projects.*, SUM(TIME_TO_SEC(TIMEDIFF(posts.ended_at, posts.started_at))/3600) as hours").
      find(params[:project_id])
  end
  
  def index
    @posts = @project.posts.order("posts.created_at DESC")
      
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
