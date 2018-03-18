class User < ApplicationRecord
  has_one :profile

  validates_presence_of :device_uuid
  validates :device_uuid, uniqueness: true

  def assign_secret(secret)
    @secret = secret
  end

end
