if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_activity_tracker_api", domain: "daily-routine-tracker.herokuapp.com"
else 
  Rails.application.config.session_store :cookie_store, key: "_activity_tracker_api"
end