Rails.application.routes.draw do
  namespace :recruiter do
    resources :jobs
    resources :submissions
  end

  namespace :public do
    resources :jobs, only: [:index, :show]
    resources :submissions, only: [:create]
  end
  post 'signup', to: 'recruiters#create'
  post 'login', to: 'recruiters#login'
end
