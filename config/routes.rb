Rails.application.routes.draw do
  get 'home/select'

  resources :questions do
    collection do
      get 'test(/:size)' => "questions#test"
      post 'result'
    end
  end
end
