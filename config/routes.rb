Journal::Application.routes.draw do
  resources :projects do
    resources :posts
  end
end
