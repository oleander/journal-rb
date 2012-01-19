Journal::Application.routes.draw do  
  resources :projects, except: [:show] do
    resources :posts, except: [:show]
  end
  
  root to: "projects#index"
  
  match "/auth/:provider/callback" => "authentications#create"
  match "/auth/failure" => "authentications#failure"

  resources :authentications
end