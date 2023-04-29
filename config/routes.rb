Rails.application.routes.draw do
  scope :api do
    resources :sessions, only: %i[create destroy]
  end
end
