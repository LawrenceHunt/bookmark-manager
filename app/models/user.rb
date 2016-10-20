require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true

  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  validates_format_of :email, as: :email_address
  # validates_presence_of :email

end