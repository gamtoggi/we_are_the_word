WeAreTheWord::Application.routes.draw do
  resources :cards do
    collection do
      get :build
    end
  end
  
  devise_for :users
  root :to => 'cards#index'
end
