class MessagesController < ApplicationController
    skip_before_filter :verify_authenticity_token
    require 'twilio-ruby'


    def msg_form
    end

    def send_message
        message_body = params["body"]
        boot_twilio

        # sms = @client.messages.create(
        #     from: Rails.application.secrets.twilio_number,
        #     to: '8475088751',
        #     body: message_body
        #     )

        @contacts = Contact.all

        @successful_msg = 0
        @contacts.each do |contact|
            sms = @client.messages.create(
                from: Rails.application.secrets.twilio_number
                to: contact.phone_num,
                body: message_body
                )
            @successful_msg += 1
        end

        redirect_to root_path, :notice => "We sent #{@successful_mg} messages out of #{@contacts} contacts successfully"

    end

    # def reply
    #     message_body = params["Body"] # Responders message
    #     from_number  = params["From"] # Responders number
    #     boot_twilio

    #     sms = @client.messages.create(
    #         from: Rails.application.secrets.twilio_number,
    #         to: from_number,
    #         body: "You responded with #{message_body}"
    #         )
    #     redirect_to(:back)
    # end

    private

    def boot_twilio
        account_sid = Rails.application.secrets.twilio_sid
        auth_token = Rails.application.secrets.twilio_token
        @client = Twilio::REST::Client.new account_sid, auth_token
    end
end
