Rails.application.routes.draw do
  namespace :webhooks do
    namespace :github do
      resources :issues, only: [] do
        get ':issue_number/events', to: 'issues/events#index', on: :collection
        post 'events', to: 'issues/events#create', on: :collection
      end
    end
  end
end
