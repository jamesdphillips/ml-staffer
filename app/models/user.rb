require "digest/md5"

class User < ActiveRecord::Base

  attr_accessor :location_update

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable # , :omniauthable

  has_many :location_updates, dependent: :destroy, order: "created_at DESC"

  attr_accessible :name, :email, :password, :password_confirmation,
                  :remember_me, :timezone, :role, :start_work_hour,
                  :end_work_hour, :gtalk_status, :bio, :location, :birthday,
                  :location_update

  before_create :generate_password

  validates :name, :email, presence: true

  def gravatar_url(size=100)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?size=#{size}"
  end

  def location_update
    location_updates.first
  end

  def location_update=(params)
    location_updates.create(params)
  end

  def update_facebook_checkin
    return unless self.fb_key
    last_checkin = location_updates.where(source: "facebook").limit(1)[0]
    checkin = FbGraph::User.me(self.fb_key).checkins[0]
    if !last_checkin || (last_checkin.external_id != checkin.identifier && checkin.created_time > last_checkin.created_at)
      location_updates.create({
        external_id: checkin.identifier,
        name: checkin.place.name,
        latitude: checkin.place.location.latitude,
        longitude: checkin.place.location.longitude,
        source: "facebook"
      })
    end
  end

  private

  def generate_password
    unless password
      self.password = self.password_confirmation = SecureRandom.urlsafe_base64(8)
    end
  end

end
