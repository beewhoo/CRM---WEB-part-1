require_relative 'contact'
require 'sinatra'



get '/home' do
  erb :home
end

get '/contacts' do
  @contacts = Contact.all
  @count = Contact.count
  erb :contacts
end

get '/about' do
  erb :about
end

get '/layout' do
  erb :layout
end



after do
  ActiveRecord::Base.connection.close
end
