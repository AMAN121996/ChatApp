
module Twilio
  class SmsService
    TWILIO_ACCOUNT_SID = 'AC3160c17d656d023aeeb10b6876b61dfc'
    TWILIO_AUTH_TOKEN = 'c73906e7c644f9446ef4d571b0ed50a5'
    TWILIO_FROM_PHONE = '+14022415598'
    TWILIO_TEST_PHONE = '+917415194210'

    def initialize(body:, to_phone_number:)
      @body = body
      @to_phone_number = to_phone_number
    end

    def call
      @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
      message = @client.messages
        .create(
          body: @body,
          from: TWILIO_FROM_PHONE,
          to: to(@to_phone_number)
        )
      puts message.sid
    end

    private

    def to(to_phone_number)
      return TWILIO_TEST_PHONE if Rails.env.development?

      to_phone_number
    end
  end
end
