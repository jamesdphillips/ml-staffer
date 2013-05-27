class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable # , :omniauthable

  attr_accessible :name, :email, :password, :password_confirmation,
                  :remember_me, :timezone, :role, :start_work_hour,
                  :end_work_hour, :gtalk_status

  before_create :generate_password

  validates :name, :email, presence: true

  private

  def generate_password
    unless password
      self.password = self.password_confirmation = SecureRandom.urlsafe_base64(8)
    end
  end

end
