Fuckitimin::Application.routes.draw do
  root to: "users#index"
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'
  resource :session

  resources :events do
    resources :attendees, only: [:create, :destroy]
  end
end
