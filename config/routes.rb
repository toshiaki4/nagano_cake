Rails.application.routes.draw do
  devise_for :admin
  
  get 'admin' => 'admin/homes#top'
  namespace :admin do
    
    get 'order_detalls/update'
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
    
  end
  devise_for :customers,:controllers => {
    :registrations => 'public/registrations',
    :sessions => 'public/sessions'  
  }
  root 'public/homes#top'
  get 'about' => 'public/homes#about'
  
  namespace :public do
    get 'addresses/index'
    post '/orders/order_confirm' => 'orders#order_confirm'
    get '/orders/complete' => 'orders#complete'
    patch '/customers/status_update' => 'customers#withdrawal'
    get '/customers/confirm' => 'customers#confirm'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resource :customers
    resources :cart_items, :only => [:index, :update, :destroy, :create]
    resources :addresses
    resources :orders
  end
    
    scope module: :public do
    resources :items, :only => [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
