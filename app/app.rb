require "sinatra/base"
# an extra gem to require
require "sinatra/activerecord"

# BCrypt for encrypting the passwords
# require "bcrypt"

class Clinickr < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end