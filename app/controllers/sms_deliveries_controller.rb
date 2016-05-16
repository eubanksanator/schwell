class SmsDeliveriesController < ApplicationController
    require 'twilio-ruby'

    def send_text
        twilio_sid = Rails.application.secrets.twilio_sid
        twilio_token = Rails.application.secrets.twilio_token

        @client = Twilio::REST::Client.new(twilio_sid, twilio_token)

        sms = @client.messages.create(
            :body => "Here is a test did it work?",
            :to => "8475088751",
            :from => "+18475088751")

        redirect_to root_path, :notice => "We sent the text successfully"
    end
end
