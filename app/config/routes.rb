Rails.application.routes.draw do
  namespace :recruiter do
    post 'signup', to: 'recruiter/recruiters#create', as: 'signup'
    post 'login', to: 'recruiter/recruiters#login', as: 'login'
    resources :jobs
    resources :submissions
  end

  namespace :public do
    resources :jobs, only: [:index, :show]
    resources :submissions, only: [:create]
  end
end
