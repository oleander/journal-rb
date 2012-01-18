module PostsHelper
  def post_paginator(posts)
    pag = paginate(@posts)
    return if @project.id.nil?
    link = link_to "New Post", new_project_post_path(@project), class: "paginate"
    if pag.empty?
      raw = link 
    else
      raw = "#{pag} | #{link}"
    end
    
    (raw + " | " + (link_to "Export project", project_posts_path(@project, format: "pdf"), class: "paginate")).html_safe
  end
end
