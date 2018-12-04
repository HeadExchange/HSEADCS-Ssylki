Rails.application.routes.draw do
  get 'welcome/index'
  resources :links

  resources :boards do
    resources :links
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
