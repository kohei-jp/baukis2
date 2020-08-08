Rails.application.routes.draw do
  namespace :staff do #名前空間 staffはモジュール名 参照する際は、Staff::TopControllerになる。
    root "top#index"
    get "login" => "sessions#new", as: :login
    resource :session, only: [ :create, :destroy ]
  end
  
  namespace :admin do
    root "top#index"
    get "login" => "session#new", as: :login
    resource :session, only: [:create, :destroy]
  end

  namespace :customer do
    root "top#index"
  end
end
