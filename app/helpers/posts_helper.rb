module PostsHelper
  def post_paginator(posts)
    pag = paginate(@posts)
    return if @project.id.nil?
    link = link_to "New Post", new_project_post_path(@project), class: "paginate"
    if pag.empty?
      "#{link} | #{content_tag(:span, "No more pages", class: "raw")}".html_safe 
    else
      "#{pag} | #{link}".html_safe
    end
  end
end
