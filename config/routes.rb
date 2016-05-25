Rails.application.routes.draw do

  get 'sms_deliveries/send_text'

  resources :contacts do
    collection do
        post :import
    end
  end


  post '/send_my_text' => 'sms_delivery#send_text'
  post '/send_my_text' => 'sms_deliveries#send_text'

  root 'contacts#index'

end
