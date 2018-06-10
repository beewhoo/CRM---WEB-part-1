require_relative 'contact'
require 'sinatra'


get '/' do
  erb :home
end

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

get '/contacts/:id' do
  params[:id]
  @contact = Contact.find_by({id: params[:id].to_i})
  if @contact
  erb :show_contact
    else
   raise Sinatra::NotFound
  end
end


after do
  ActiveRecord::Base.connection.close
end
