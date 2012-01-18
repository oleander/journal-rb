module PostsHelper
  def paginator(posts)
    pag = paginate(@posts)
    return if @project.id.nil?
    link = link_to "New Post", new_project_post_path(@project)
    if pag.empty?
      "#{link} | Next page".html_safe 
    else
      "#{pag} | #{link}".html_safe
    end
  end
end
