Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :votes, only: [:index, :show, :create]
      get '/candidate/:address/votes', to: 'votes#candidate_votes'
    end
  end
end