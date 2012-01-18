module ProjectsHelper
  def project_paginator(projects)
    pag = paginate(projects)
    link = link_to "New project", new_project_path, class: "paginate"
    if pag.empty?
      "#{link} | #{content_tag(:span, "No more pages", class: "raw")}".html_safe 
    else
      "#{pag} | #{link}".html_safe
    end
  end
end
