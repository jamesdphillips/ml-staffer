require "digest/md5"

class User < ActiveRecord::Base

  attr_accessor :location

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable # , :omniauthable

  has_many :location_updates, dependent: :destroy, order: "created_at DESC"

  attr_accessible :name, :email, :password, :password_confirmation,
                  :remember_me, :timezone, :role, :start_work_hour,
<<<<<<< HEAD
                  :end_work_hour, :gtalk_status, :location
=======
                  :end_work_hour, :gtalk_status, :bio, :location, :birthday
>>>>>>> Facebook authentication

  before_create :generate_password

  validates :name, :email, presence: true

  def gravatar_url(size=100)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?size=#{size}"
  end

  def location
    location_updates.first
  end

  def location=(params)
    location_updates.create(params)
  end

  private

  def generate_password
    unless password
      self.password = self.password_confirmation = SecureRandom.urlsafe_base64(8)
    end
  end

end
