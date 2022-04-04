require "sinatra/base"
require "sinatra/activerecord"

class Clinickr < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end