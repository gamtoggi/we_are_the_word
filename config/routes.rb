WeAreTheWord::Application.routes.draw do
  resources :cards

  devise_for :users

  root :to => 'welcome#index'
end
