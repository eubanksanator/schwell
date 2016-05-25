Rails.application.routes.draw do


  resources :contacts do
    collection do
        post :import
    end
  end

  get 'sms_deliveries/create_message'

  post '/send_my_text' => 'sms_deliveries#send_text'

  root 'contacts#index'

end
