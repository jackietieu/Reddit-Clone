Rails.application.routes.draw do
  resources :users, except: [:index, :show]

  resource :session, only: [:new, :create, :destroy]

  resources :subs do
    resources :posts, only: [:index, :new, :create, :show] do
        resources :comments, only: [:index, :new]
    end
  end

  resources :comments, only: [:create, :show]

  resources :posts, except: [:index, :new, :create, :show]
end
