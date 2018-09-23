Rails.application.routes.draw do

  root 'tasks#index'
  # root route says what do I get for '/'
  #localhost:3000 goes to route route
  resources :tasks

  post '/tasks/:id/checkoff', to: 'tasks#checkoff', as: 'checkoff_task'

  post '/tasks/:id/uncheck', to: 'tasks#uncheck', as: 'uncheck_task'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
