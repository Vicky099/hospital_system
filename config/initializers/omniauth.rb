OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],{:scope=>:public_profile, :provider_ignores_state => true}
  #provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
