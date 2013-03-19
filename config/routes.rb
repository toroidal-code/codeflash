Codeflash::Application.routes.draw do

  resources :profiles

  devise_for :users

  resources :achievements
  resources :languages
  resources :language_families
  resources :solutions, only: [:index]
  resources :problems do
    resources :solutions do
      member do
        put 'upvote'
        put 'downvote'
      end
      resources :comments do
        member do
          put 'upvote'
          put 'downvote'
        end
      end
    end
    resources :comments do
      member do
        put 'upvote'
        put 'downvote'
      end
    end
  end

  devise_scope :user do
    get "login" , to: "devise/sessions#new"
    get "signup", to: "devise/registrations#new"
    delete "logout", to: "devise/sessions#destroy"
  end

  root to: 'high_voltage/pages#show', id: 'home'

end
