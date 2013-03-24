Codeflash::Application.routes.draw do

  resources :flags

  resources :profiles

  devise_for :users

  concern :votable do
    member do
      put 'upvote'
      put 'downvote'
    end
  end

  concern :commentable do
    resources :comments, concerns: :votable
  end

  resources :achievements
  resources :languages
  resources :language_families
  resources :solutions, only: [:index]
  resources :problems, concerns: :commentable do
    resources :solutions, concerns: [:votable, :commentable]
  end

  devise_scope :user do
    get "login" , to: "devise/sessions#new"
    get "signup", to: "devise/registrations#new"
    delete "logout", to: "devise/sessions#destroy"
  end

  root to: 'high_voltage/pages#show', id: 'home'

end
