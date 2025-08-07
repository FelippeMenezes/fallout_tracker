# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

config.database_configuration = { "production" => { "url" => ENV["DATABASE_URL"] } }

