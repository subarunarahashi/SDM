Rails.application.routes.draw do
  resources :work_tests
  get 'assign_shift/index'
  get 'show_reports/index'
  get 'teaching_assistants/index'
  get 'courses/index'
  get 'top/index'
  root "top#index"

  post '/check_data', to: "show_reports#check_data"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
