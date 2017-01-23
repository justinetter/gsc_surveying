class User < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name, length: { minimum: 3 }
  validates_presence_of :password, length: { minimum: 4 }
  validates_confirmation_of :password

  before_create :encrypt_password, :gen_auth_token
  
  def update_token
    self.gen_auth_token
    self.save
  end

  def gen_auth_token
    begin
      self.auth_token = SecureRandom.urlsafe_base64
    end while User.exists? auth_token: self.auth_token
  end

  def self.authenticate name, password
    user = self.find_by_name name
    # if user found and password matches decrypted one saved in db
    if user && user.password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  private
    def encrypt_password
      if self.password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password = BCrypt::Engine.hash_secret(self.password, self.password_salt)
      end
    end
end
