Rails.application.routes.draw do
  devise_for :users
  root to: 'home#select'

  get 'home/select'

  resources :questions do
    collection do
      get 'test/(:question_set_id/size(/:size))' => "questions#test"
      post 'result'
    end
  end
end
