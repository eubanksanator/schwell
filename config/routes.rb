Rails.application.routes.draw do


  resources :contacts do
    collection do
        post :import
    end
  end

  get '/create_msg' => 'messages#text_form'

  post '/send_my_text' => 'messages#send_my_text'
  # post '/reply' => 'messages#reply'
  # Create Endpoint in Twilio Dashboard "www.schwell.com/messages/reply"

  root 'static_pages#home'

end
