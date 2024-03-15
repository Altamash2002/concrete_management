# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.smtp_settings = {
#   :user_name => 'apikey',
#   :password => Rails.application.credentials.fetch(:sendgrid_key),
#   :domain => 'nexusevents.io',
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true 
# }

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :user_name => 'kishanprajapati8767@gmail.com',
  :password => 'exxuqcyddkvdzkuz',
  :authentication => :plain,
  :enable_starttls_auto => true
}