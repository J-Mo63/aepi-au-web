Rails.application.routes.draw do
  get 'forums/index'

  get 'forums/show'

  get 'forums/edit'

  get 'forums/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#landing'
end
