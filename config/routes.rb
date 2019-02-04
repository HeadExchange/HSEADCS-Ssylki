Rails.application.routes.draw do
  devise_for :users
  root to: "boards#index"
  get 'welcome/index'
  resources :links

  resources :boards do
    member do
      get "publish"
    end
    resources :links
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
