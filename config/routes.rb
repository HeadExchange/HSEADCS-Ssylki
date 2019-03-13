Rails.application.routes.draw do
  devise_for :users

  # constraints(nickname: UserRouteConstraints.new) do
    get '/:nickname',      to: 'users#show', as: 'user_by_nickname', :constraints => UserRouteConstraints.new
    get '/:nickname/edit', to: 'users#edit', as: 'edit_user_by_nickname'
  # end

  root to: "boards#index"
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
end
