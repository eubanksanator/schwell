Rails.application.routes.draw do


  resources :contacts do
    collection do
        post :import
    end
  end

  get 'messages/create_message'

  post '/send_my_text' => 'messages#send_text'

  root 'contacts#index'

end
