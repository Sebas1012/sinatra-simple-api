require 'sinatra'
require 'tiny_tds'
require 'json'
require 'dotenv'

Dotenv.load('.env')

db = TinyTds::Client.new(username: ENV['DB_USER'], password: ENV['DB_PASS'], host: ENV['DB_HOST'], port: ENV['DB_PORT'], database: ENV['DB_DB'])

#Get all users
get '/users' do
  @result = db.execute("SELECT * FROM users").each.to_json
end

# Get a user
get '/users/:id' do
  @result = db.execute("SELECT * FROM users WHERE id = #{params[:id].to_i}").each.to_json
end
