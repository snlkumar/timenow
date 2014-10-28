# Be sure to restart your server when you modify this file.


# change top level domain size

Rails3Subdomains::Application.config.session_store :cookie_store, key: '_rails3-subdomains_session',:domain => ".yumengine.com"
# request.domain(2)
# request.subdomain(2)
# Rails.application.config.session_store :cookie_store, :key => '_rails3-subdomains_session', :domain => "lvh.me"

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Rails3Subdomains::Application.config.session_store :active_record_store
