class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_one :picture, as: :imageable, dependent: :destroy
  enum gender: {male: '0', female: '1'}

  def self.from_omniauth(auth)
    binding.pry
    where(provider: auth.provider, uid: auth.uid).first_or_create do |doctor|
      doctor.email = auth.info.email
      doctor.provider = auth.provider
      doctor.uid = auth.uid
      doctor.password = Devise.friendly_token[0,20]
      #user.full_name = auth.info.first_name+ " " +auth.info.last_name
    end
  end

  def photo_url
    if self.picture.present?
      return self.picture.photo_url
    else
      return 'http://res.cloudinary.com/ddbkhb3vl/image/asset/v1517130970/default-f923b61d87de05d96ee32141d21c6e68.png'
    end
  end

end
