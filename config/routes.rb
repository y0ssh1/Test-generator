Rails.application.routes.draw do
  root to: 'question_sets#index'

  devise_for :users

  resources :questions, only: [:destroy, :new, :update]
  resources :question_sets do
    member do
      get 'test/size(/:size)' => 'question_sets#test'
      post 'result' => 'question_sets#result'
    end
  end
end
