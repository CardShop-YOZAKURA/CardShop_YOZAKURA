Rails.application.routes.draw do
  
  #devise顧客用
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
    passwords: 'public/passwords'
  }
  
  #devise管理者用
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  
  #顧客用
  scope module: :public do
    root :to => 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show] do
      collection do
        get 'search'
      end
      
    end
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
      
    end
    resources :cart_items, except: [:new, :show, :edit] do
      collection do
        delete 'destroy_all'
      end
      
    end
    resources :orders, only: [:new, :index, :show, :create] do
      collecion do
        post 'check'
        get 'complete'
      end
      
    end
    resources :addresses, except: [:new, :show]
  end
  
  #管理者用
  namespace :admin do
    root :to => 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end
  
end
