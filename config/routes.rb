Fuckitimin::Application.routes.draw do
  root to: "static_pages#index"
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'
  resource :session

  resources :users, only: [:show]
  resources :events do
    get "friend_index", on: :collection
    resources :attendees, only: [:create]
  end
  resources :attendees, only: [:destroy]

  resources :users
  post "locations/new_ajax", to: "locations#new_by_ajax", as: "new_ajax_location"
  post "locations/new_form", to: "locations#new_by_form", as: "new_form_location"
  get "locations/set", to: "locations#set", as: "set_location"
end
