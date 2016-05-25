class MessagesController < ApplicationController
    require 'twilio-ruby'
    # before_filter :boot_twilio :except => [:message_form]

    def message_form
    end

    def send_message
        message_body = params["body"]
        boot_twilio

        sms = @client.messages.create(
            from: Rails.application.secrets.twilio_number,
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

    def reply
        message_body = params["Body"] # Responders message
        from_number  = params["From"] # Responders number
        boot_twilio

        sms = @client.messages.create(
            from: Rails.application.secrets.twilio_number,
            to: from_number,
            body: "You responded with #{message_body}"
            )
    end

    private

    def boot_twilio
        account_sid = Rails.application.secrets.twilio_sid
        auth_token = Rails.application.secrets.twilio_token
        @client = Twilio::REST::Client.new account_sid, auth_token
    end
end
