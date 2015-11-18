Rails.application.routes.draw do
  resources :questions
  resources :posts

  get 'about' => 'welcome#about'

  root to: 'welcome#index' #this is an implied hash
end
