Rails.application.routes.draw do

  root 'tasks#index'

  get '/tasks', to: 'tasks#index'

  get '/tasks/new', to: 'tasks#new', as: 'new_book'
  post '/tasks', to: 'tasks#create', as: 'books'

  get '/tasks/:id', to: 'tasks#show', as: 'book'
  
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update'

  delete '/tasks/:id', to: 'tasks#destroy', as: 'delete_task'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
