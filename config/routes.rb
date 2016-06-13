Rails.application.routes.draw do
  resources :questions do
    collection do
      get 'test'
      get 'result'
    end
  end
end
