OmniAuth.config.logger = Rails.logger
# FACEBOOK_APP_ID = 589756371110398
# FACEBOOK_SECRET = 427e7378a14b7c741353d7c4bfba0ff6


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '589756371110398', '427e7378a14b7c741353d7c4bfba0ff6'
end
