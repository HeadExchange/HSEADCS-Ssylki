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

  get 'b/:share_url' => 'boards#shared', as: 'shared_board'

  resources :boards do
    member do
      get "publish"
    end
    resources :links
    resources :collaborations
  end

  resources :users

  get 'results', to: 'results#index', as: 'results'

  resources :boards do
    resources :collaborations
  end

  root to: "boards#index"

end
