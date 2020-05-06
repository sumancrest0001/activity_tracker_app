if Rails.env == "production"
  Rails.application.config.session_store :cookie_store,
  key: "_activity_tracker_api",
  domain: "track-my-activity.herokuapp.com",
  secure: true,
  same_site: :strict
else 
  Rails.application.config.session_store :cookie_store, key: "_activity_tracker_api"
end