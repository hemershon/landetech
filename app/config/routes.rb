Rails.application.routes.draw do
  namespace :recruiter do
    post 'signup', to: 'recruiters#create'
    post 'login', to: 'recruiters#login'
    resources :jobs
    resources :submissions
  end

  namespace :public do
    resources :jobs, only: [:index, :show]
    resources :submissions, only: [:create]
  end
end
