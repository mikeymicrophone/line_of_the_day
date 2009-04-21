# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_line_of_the_day_session',
  :secret      => '091f13890dbb137ca005eea3b3dce65d14307cd048daf08e536eec6119316878267306cc45af805a16f6aa64800db19b6af7db4fee1342588d08e29666ac32f6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
