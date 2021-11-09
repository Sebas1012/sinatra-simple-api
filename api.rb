require 'sinatra'
require 'tiny_tds'
require 'json'
require 'dotenv'

Dotenv.load('.env')

db = TinyTds::Client.new(username: ENV['DB_USER'], password: ENV['DB_PASS'], host: ENV['DB_HOST'], port: ENV['DB_PORT'], database: ENV['DB_DB'])

before do
  content_type :json
end

#Get all users
get '/users' do
  db.execute("SELECT * FROM users").each.to_json
end

# Get a user
get '/users/:id' do
  db.execute("SELECT * FROM users WHERE id = #{params[:id].to_i}").each.to_json
end

#Create a new user
post '/users' do
  data = JSON.parse request.body.read

  db.execute("INSERT INTO users(username, description) VALUES('#{data['username']}', '#{data['description']}')")
  db.execute("SELECT * FROM users WHERE id = (SELECT MAX(id) FROM users)").each.to_json
end

#Delete a User
delete '/users/:id' do
  db.execute("DELETE FROM users WHERE id = #{params[:id].to_i}")
end
