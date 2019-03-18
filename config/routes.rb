Rails.application.routes.draw do
  devise_for :users

  get '/:nickname',      to: 'users#show', as: 'user_by_nickname', :constraints => UserRouteConstraints.new
  get '/:nickname/edit', to: 'users#edit', as: 'edit_user_by_nickname'

  get 'welcome/index'
  resources :links do
    collection do
      patch :sort
    end
  end

  resources :boards do
    member do
      get "publish"
    end
    resources :links
  end

  resources :users

  get 'results', to: 'results#index', as: 'results'

  root to: "boards#index"
end
