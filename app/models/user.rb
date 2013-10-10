class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = User.where(email: email).first
    # throw Exception.new(user.password_hash) #uncaught throw #<Exception: $2a$10$9FHhPyb7BW01ktwTTgZHX.hlKKv4ajX/dX9D/xNGmZoajJTdGG4N.>
    # throw Exception.new(user.password_salt) #uncaught throw #<Exception: $2a$10$9FHhPyb7BW01ktwTTgZHX.>
    # throw Exception.new(BCrypt::Engine.hash_secret(password, user.password_salt)) #uncaught throw #<Exception: $2a$10$9FHhPyb7BW01ktwTTgZHX.O62xalJit020Jb0g5XDdB5V8dGMslQS>
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end

