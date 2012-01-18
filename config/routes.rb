Journal::Application.routes.draw do
  resources :projects, except: [:show] do
    resources :posts, except: [:show]
  end
  
  root to: "projects#index"
end
