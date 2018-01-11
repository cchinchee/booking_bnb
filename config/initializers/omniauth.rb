 # In config/initializers/omniauth.rb
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'],  scope: "public_profile", info_fields: "gender, name, email, picture"
  	provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], scope: "profile, email", info_fields: "gender, name, email, picture"
  end