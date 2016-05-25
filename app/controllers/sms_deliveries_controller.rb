class SmsDeliveriesController < ApplicationController
    require 'twilio-ruby'

    def create_message

    end

    def send_text
        account_sid = Rails.application.secrets.twilio_sid
        auth_token = Rails.application.secrets.twilio_token
        @client = Twilio::Rest::Client.new account_sid, auth_token

        message_body = params["body"]
        sms = @client.messages.create(
            from: '18472326161',
            to: '8475088751',
            body: message_body
            )

        # contacts = Contact.all

        # contacts.each do |contact|
        #     sms = @client.messages.create(
        #         from: # add your twilio number here
        #         to: contact.phone_num,
        #         body: message_body
        #         )
        # end

        # twilio_sid = Rails.application.secrets.twilio_sid
        # twilio_token = Rails.application.secrets.twilio_token

        # @client = Twilio::REST::Client.new(twilio_sid, twilio_token)

        # sms = @client.messages.create(
        #     :body => "Here is a test did it work?",
        #     :to => "8475088751",
        #     :from => "+18475088751")

        redirect_to root_path, :notice => "We sent the text successfully"

    end
end
