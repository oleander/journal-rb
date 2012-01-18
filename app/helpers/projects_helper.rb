module ProjectsHelper
  def project_paginator(projects)
    pag = paginate(projects)
    link = link_to "New project", new_project_path, class: "paginate"
    if pag.empty?
      raw = link
    else
      raw = "#{pag} | #{link}"
    end
    
    if logged_in?
      (raw + " | " + (link_to  "Log out", authentication_path(rand(10**3)), method: :delete, class: "paginate")).html_safe
    else
      (raw + " | " + (link_to "Log in using Google", "/auth/google", class: "paginate")).html_safe
    end
  end
end
