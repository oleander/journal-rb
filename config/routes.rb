Journal::Application.routes.draw do
  root to: "projects#index"
  
  resources :projects, except: [:show] do
    resources :posts, except: [:show]
  end
  
  match "/auth/:provider/callback" => "authentications#create"
  match "/auth/failure" => "authentications#failure"

  resources :authentications
end
