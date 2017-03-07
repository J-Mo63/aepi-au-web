Rails.application.routes.draw do
  devise_for :users

  get 'forums', to: 'forums#index'
  get 'forums/show', to: 'forums#show'
  get 'forums/edit', to: 'forums#edit'
  get 'forums/new', to: 'forums#new'
  post 'forums', to: 'forums#create'

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#landing'
end
