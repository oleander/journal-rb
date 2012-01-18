module ProjectsHelper
  def project_paginator(projects)
    pag = paginate(projects)
    link = link_to "New project", new_project_path, class: "paginate"
    if pag.empty?
      "#{link} | No more page".html_safe 
    else
      "#{pag} | #{link}".html_safe
    end
  end
end
