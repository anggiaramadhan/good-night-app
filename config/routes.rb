Rails.application.routes.draw do
  defaults format: :json do
    scope :api do
      resources :sessions, only: :create
      resources :records, only: %i[create update]

      put 'users/:id/follow', to: 'users#follow', as: :follow_user
      put 'users/:id/unfollow', to: 'users#unfollow', as: :unfollow_user
    end
  end
end
