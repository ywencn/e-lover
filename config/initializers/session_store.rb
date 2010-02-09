# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_e-lover_session',
  :secret      => '836b27865c8b2e5a772ea5c36d25b9e21ff81f3aadd73f6c18116d32822233595abf444e9553bc78cec634e53d0a8418cb01d514b0c089fcb99da6b08416fa90'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
