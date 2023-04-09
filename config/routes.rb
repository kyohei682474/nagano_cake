Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  namespace :public do
  root to: "homes#top"
  get 'homes/about' => 'homes#about',as: 'about'
  resources :items,only: [:index, :show]
  get 'customers/my_page'=> 'customers#show' 
  get 'customers/infomation/edit'=> 'customers#edit' 
  patch 'customers/infomation' => 'customers#update' 
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  get 'customers/withdrawal'  => 'customers#withdrawal'
  delete 'cart_items/destroy_all'  => 'cart_items#destroy_all'
  resources :cart_items,only:[:index,:update,:show,:create,:destroy]
  get 'orders/confirm' => 'orders#confirm'#post
  get 'orders/complete' => 'orders#complete'
  resources :orders,only:[:index,:show,:create,:new]
  
  
  
 end
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    root to: "homes#top"
    
  end
  
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
