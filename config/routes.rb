WeAreTheWord::Application.routes.draw do
  resources :cards do
    collection do
      get :build
    end
    member do
      put :level_up
    end
  end
  
  devise_for :users
  root :to => 'cards#index'
end
