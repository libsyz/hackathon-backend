Rails.application.routes.draw do 
  scope :api, defaults: {format: :json} do
    devise_for :users, controllers: {sessions: 'v1/sessions',
                                     registrations: 'v1/registrations'}
    resources :users, only: [:index, :show]
    resources :hackathons, only: [:create, :show, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
