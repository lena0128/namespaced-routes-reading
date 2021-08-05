Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # Scoping allows us to prefix a block of routes under one grouping
  # routes should be DRY too!!!
  # the new /admin/stats helpers are stats_path and stats_url
  # We are telling Rails that we want to use /admin as a URL prefix
  # We also let Rails know that all of the included routes will be handled by controllers in the admin module 
  # If you switch from scope to namespace, take care to update any URL helpers you have in use

  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
