Rails.application.routes.draw do
  scope :api do
    resources :sessions, only: :create
    resources :records, only: %i[create update]
  end
end
