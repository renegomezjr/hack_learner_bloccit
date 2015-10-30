Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  root to: 'welcome#index' #this is an implied hash
end
