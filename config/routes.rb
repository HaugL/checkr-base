Rails.application.routes.draw do
  resources :users, constraints: { format: 'json' }
end
