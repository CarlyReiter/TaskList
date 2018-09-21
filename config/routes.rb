Rails.application.routes.draw do

  root 'tasks#index'
  # root route says what do I get for '/'
  #localhost:3000 goes to route route

  get '/tasks', to: 'tasks#index', as: 'tasks'

  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create'

  get '/tasks/:id', to: 'tasks#show', as: 'task'

  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update'

  post '/tasks/:id/checkoff', to: 'tasks#checkoff', as: 'checkoff_task'


  delete '/tasks/:id', to: 'tasks#destroy'
  # as: 'delete_task'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
