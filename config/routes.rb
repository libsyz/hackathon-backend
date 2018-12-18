Rails.application.routes.draw do 
  scope :api, defaults: {format: :json} do
    devise_for :users, controllers: {sessions: 'v1/sessions',
                                     registrations: 'v1/registrations'}
    resources :users, only: [:index, :show]
    resources :hackathons, only: [:create, :show, :index, :update]
    resources :notifications, only: [:create, :destroy, :index]
    patch 'hackathon_phases/edit_phase', to: 'hackathon_phases#edit'
    put 'add_hacker', to: 'hackathons#add_hacker'
    patch 'remove_hacker', to: 'hackathons#remove_hacker'
    get 'remove_notifications', to: 'notifications#destroy_all'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
