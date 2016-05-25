Rails.application.routes.draw do


  resources :contacts do
    collection do
        post :import
    end
  end

  get 'sms_delivery/create_message'

  post '/send_my_text' => 'sms_delivery#send_text'

  root 'contacts#index'

end
