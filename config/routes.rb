Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :ingredients
  # resources :drinks
  scope '/api' do
    resources :drinks
  end

  get "*path", to: "application#fallback_index_html", contraints: -> (request) do
    !request.xhr? && request.format.html?
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
