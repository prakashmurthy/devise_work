class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :custom_status, :logged_in
  # attr_accessible :title, :body
  validates :name, :presence => true

  def online?
    updated_at > Devise.timeout_in.ago
  end

  def status
    (self.logged_in || self.logged_in.nil? ) && self.online? ? "IN" : "OUT"     
  end
end
