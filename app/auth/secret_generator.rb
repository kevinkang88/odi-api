class SecretGenerator
  prepend SimpleCommand
  attr_accessor :app_id, :key

  #this is where parameters are taken when the command is called
  def initialize(app_id, key)
    @app_id = app_id
    @key = key
  end

  #this is where the result gets returned
  def call
    JsonWebToken.encode_secret( { app_id: app_id, key: key } )
  end

end
