Todo::Application.routes.draw do
  match('/', {:via => :get, :to => 'tasks#index'})
  match('/', {:via => :post, :to => 'tasks#create'})
  match('/:id/edit', {:via => :get, :to => 'tasks#edit'})
  match('/tasks/:id', {:via => [:patch, :put], :to => 'tasks#update'})
  match('/:id', {:via => :get, :to => 'tasks#show'})
  match('/:id/destroy', {:via => :delete, :to => 'tasks#destroy'})
end
