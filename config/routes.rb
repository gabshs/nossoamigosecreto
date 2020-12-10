require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  mount Sidekiq::Web => '/sidekiq'

  root 'pages#home'
  resources :campaigns, except :new do
    post 'raffle', on: :member
    # campaigns/:id/raffle
    # post 'raffle', on: :collection para a rota campaigns/raffle
  end
  get 'members/:token/opened', to: 'members#opened'
  resources :members, only: [:create, :update, :destroy]
end
