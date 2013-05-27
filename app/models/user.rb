class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable # , :omniauthable

  attr_accessible :name, :email, :password, :password_confirmation,
                  :remember_me, :timezone

  before_create :generate_password

  private

  def generate_password
    unless password
      self.password = self.password_confirmation = SecureRandom.urlsafe_base64(8)
    end
  end

end
