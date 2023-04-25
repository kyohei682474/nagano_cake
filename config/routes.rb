Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  scope module:  :public do
  root to: 'homes#top'
  get 'homes/about' => 'homes#about',as: 'about'
  resources :items,only: [:index, :show,:edit,:new]
  get 'customers/my_page'=> 'customers#show'
  get 'customers/infomation/edit'=> 'customers#edit'
  patch 'customers/infomation' => 'customers#update'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdrawal'  => 'customers#withdrawal'
  delete 'cart_items/destroy_all'  => 'cart_items#destroy_all'
  resources :cart_items,only:[:index,:update,:show,:create,:destroy]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  resources :orders,only:[:index,:show,:create,:new]
  resources :addresses ,only:[:index,:edit,:create,:update,:destroy]



 end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
  root to: 'homes#top'
  resources :items,only:[:index,:new,:edit,:create,:show,:update,]
  resources :genres,only:[:index,:edit,:create,:update,]
  resources :customers,only:[:index,:show,:edit,:update]
  resources :orders,only:[:show,:update]
  resources :order_items,only:[:update]


  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
