WeAreTheWord::Application.routes.draw do
  resources :cards
  
  devise_for :users
  root :to => 'cards#index'
end
