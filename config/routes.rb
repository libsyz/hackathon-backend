Rails.application.routes.draw do 
  scope :api, defaults: {format: :json} do
    devise_for :users, controllers: {sessions: 'v1/sessions',
                                     registrations: 'v1/registrations'}
    resources :users, only: [:index, :show]
    resources :hackathons, only: [:create, :show, :index]
    patch 'hackathon_phases/edit_phase', to: 'hackathon_phases#edit'
    patch 'hackathons/add_hacker', to: 'hackathons#add_hacker'
    patch 'hackathons/remove_hacker', to: 'hackathons#remove_hacker'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
