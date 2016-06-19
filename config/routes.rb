Rails.application.routes.draw do
  resources :questions do
    collection do
      get 'test(/:size)' => "questions#test"
      post 'result'
    end
  end
end
