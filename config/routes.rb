Rails.application.routes.draw do
  get 'question/new'

  get 'question/delete'

  get 'question/update'

  root to: 'question_sets#index'

  devise_for :users

  resources :question_sets do
    resources :questions, only: [:delete, :new, :update] do
      resources :question, only: [:delete, :new, :update]

      collection do
        get 'test/size(/:size)' => 'question_sets#test'
        post 'result' => 'question_sets#result'
      end
    end
  end
end
