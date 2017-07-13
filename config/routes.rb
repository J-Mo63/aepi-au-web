Rails.application.routes.draw do
  resources :contacts
  resources :jobs
  resources :comments
  resources :posts
  resources :boards
  devise_for :users, :controllers => {
    :registrations => "registrations"
  }

	get 'forums/academics', to: 'forums#academics'

  resources :forums, as: :forum

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#landing'
end
