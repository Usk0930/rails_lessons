Rails.application.routes.draw do
  get '/', to: 'top#index'
  # resourcesを宣言するだけで、コントローラのindex、show、new、edit、create、update、destroyアクションを個別に宣言しなくても1行で宣言が完了します。
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
