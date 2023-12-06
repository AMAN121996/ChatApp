# app/controllers/sms_controller.rb
class SmsController < ApplicationController
  def send_sms
    twi_obj = TwilioTextMessenger.new
    response =  twi_obj.call

    respond_to do |format|
      format.json { render json: response }
    end
  end
end
