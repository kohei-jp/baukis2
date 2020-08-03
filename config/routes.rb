Rails.application.routes.draw do
  namespace :staff do #名前空間 staffはモジュール名 参照する際は、Staff::TopControllerになる。
    root "top#index"
  end
  
  namespace :admin do
    root "top#index"
  end

  namespace :customer do
    root "top#index"
  end
end
