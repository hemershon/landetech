Rails.application.routes.draw do
  namespace :recruiter do
    resources :jobs
    resources :submissions, only: [:create]
  end

  namespace :public do
    resources :jobs, only: [:index, :show]
  end

  post 'login', to: 'recruiters#login'
  post 'signup', to: 'recruiters#create'
end
