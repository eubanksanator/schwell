Rails.application.routes.draw do

  resources :contacts do
    collection { post :import }
  end

  root 'contacts#index'

end
