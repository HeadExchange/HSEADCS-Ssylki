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
      get "favourite"
    end
    resources :links
    resources :collaborations
  end

  resources :users

  resources :public
  resources :private
  resources :collaborative

  get 'results', to: 'results#index', as: 'results'

  root to: "boards#index"

end
