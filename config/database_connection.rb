# config/initializers/database_connection.rb

if ENV['DATABASE_URL']
  Rails.application.config.after_initialize do
    ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  end
end
