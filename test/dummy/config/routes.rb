Rails.application.routes.draw do
  resources :user_profiles
  namespace :sal do
    resources :payments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
