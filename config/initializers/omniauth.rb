Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google, APP_CONFIG["auth"]["google"]["first"], APP_CONFIG["auth"]["google"]["last"]
end