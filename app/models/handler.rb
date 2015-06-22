class Handler < ActiveRecord::Base
  
  has_many :dogs
  
  

  
  attr_accessor :password
  
  
  validates :email, :presence => true, :uniqueness => true
  validates_presence_of :first_name, :last_name
  validates :password, :confirmation => true
  #validates_confirmation_of :password
  #Only on Create so other actions like update password attribute can be nil
  #validates_length_of :password, :in => 6..20, :on => :create
  validates_uniqueness_of :reg, :message => "An account with that registration number already exists"
  
  #not sure why this doesn't work?
  # :email, :first_name, :last_name, :reg, :password, :password_confirmation

  before_save :encrypt_password
  after_save :clear_password
  
  def encrypt_password
    unless password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
  
  
def self.authenticate(email = "", password = "")
  
  handler = Handler.find_by_email(email)
  if handler && handler.encrypted_password == BCrypt::Engine.hash_secret(password, handler.salt)
    return handler
  else
    return false
  end
end   


  
  
end
