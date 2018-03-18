class AuthenticateDevice
  prepend SimpleCommand
  attr_accessor :device_uuid, :secret

  #this is where parameters are taken when the command is called
  def initialize(device_uuid, secret)
    @device_uuid = device_uuid
    @secret = secret
  end

  def call
    decoded_secret = JsonWebToken.decode(secret)
    if (decoded_secret['app_id'] == ENV['APP_ID']) && (decoded_secret['key'] == ENV['APP_ANSWER_KEY'])
      user = User.find_or_create_by(device_uuid: device_uuid)
      return JsonWebToken.encode(user_id: user.id)
    else
      errors.add :user_authentication, 'Invalid secret'
    end
  end
end
