Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homepages#index"

  resources :sessions, only: [:create, :show], param: :token
  get "/sign_in", to: "sessions#new", as: "sign_in"
  delete "/sign_out", to: "sessions#destroy", as: "sign_out"
end
