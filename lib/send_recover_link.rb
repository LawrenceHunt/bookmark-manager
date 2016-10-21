require 'mailgun'
class SendRecoverLink

 def initialize(mailer: nil)
   @mailer = mailer || Mailgun::Client.new(ENV["pubkey-2dd4f24e21ba253bc4cffec9c863bc23"])
 end

 def self.call(user, mailer = nil)
   new(mailer: mailer).call(user)
 end

 def call(user)
   mailer.send_message(ENV["sandbox368854520fe04998b685c874bf3f7c29.mailgun.org"],
      {from: "bookmarkmanager@mail.com",
       to: user.email,
       subject: "reset your password",
       text: "click here to reset your password https://bookmarklandia.herokuapp.com/reset_password?token=#{user.password_token}" })
 end

 private
 attr_reader :mailer
end
