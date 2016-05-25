Rails.application.routes.draw do


  resources :contacts do
    collection do
        post :import
    end
  end

  get 'messages/message_form'

  post '/send_my_text' => 'messages#send_text'
  post '/reply' => 'messages#reply' # Create Endpoint in Twilio Dashboard "www.schwell.com/messages/reply"

  root 'contacts#index'

end
