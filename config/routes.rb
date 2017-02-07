Rails.application.routes.draw do
  devise_for :users
  get 'forums/index'

  get 'forums/show'

  get 'forums/edit'

  get 'forums/new'

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#landing'
end
