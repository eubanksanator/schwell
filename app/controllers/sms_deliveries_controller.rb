class SmsDeliveriesController < ApplicationController
    require 'twilio-ruby'

    def create_message

    end

    def send_text
        account_sid = Rails.application.secrets.twilio_sid
        auth_token = Rails.application.secrets.twilio_token
        @client = Twilio::Rest::Client.new account_sid, auth_token

        contacts = Contact.all
        message_body = params["body"]

        contacts.each do |contact|
            sms = @client.messages.create(
                from: # add your twilio number here
                to: contact.phone_num,
                body: message_body
                )
        end
    end
end
