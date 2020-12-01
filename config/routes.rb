Rails.application.routes.draw do
  resources :issues, only: [] do
    get 'events', to: 'issues/events#index'
    post 'events', to: 'issues/events#create', on: :collection
  end
end
