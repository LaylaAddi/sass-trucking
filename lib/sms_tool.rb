module SmsTool
	account_sid = ENV['TWILIO_SID']
  auth_token = ENV['TWILIO_TOKEN']

  @client = Twilio::REST::Client.new account_sid, auth_token

	def self.send_sms(number:, message:)
		@client.messages.create(
      from: ENV['TWILIO_TELE'],
      to: "+1#{number}",
      body: "#{message}"
    )
	end
end