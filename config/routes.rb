Rails.application.routes.draw do
    devise_for :users, controllers: { omniauth_callbacks: 'omniauth'}
    get 'welcome/index'
    devise_for :views
    root to: "welcome#index"
    resources :users do
      resources :posts do
        resources :comments
      end
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
