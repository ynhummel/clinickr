require "sinatra"
require "sinatra/activerecord"
require "./lib/result"

class Clinickr < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end

set :bind, '0.0.0.0'

get '/' do
  "Hello world"
end
