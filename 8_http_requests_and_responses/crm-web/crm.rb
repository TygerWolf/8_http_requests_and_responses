require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'
# require 'data_mapper'

# DataMapper.setup(:default, "sqlite3:database.sqlite3")


@@rolodex = Rolodex.new

@@rolodex.add_new_contact(Contact.new("Sandeep", "Dhanjani", "sd@gmail.com", "What a guy!"))
@@rolodex.add_new_contact(Contact.new("Matt", "Holtom", "matt@gmail.com", "What's up!"))

get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get "/contacts" do
  if params.empty?
    @contacts = @@rolodex.contacts
  else
    @contacts = @@rolodex.find(params[:trait], params[:search_goal])
   end
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get '/contacts/search' do
  erb :id_search
end

get '/contacts/:id/edit' do
  @contact = @@rolodex.find("id", params[:id].to_i)[0]
  erb :edit_contact
end

post '/contacts/:id' do
  @@rolodex.edit_contact(params[:id], params[:first_name], params[:last_name], params[:email], params[:note])
  @contacts = @@rolodex.contacts
  erb :contacts
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  @@rolodex.add_new_contact(new_contact)
  redirect to('/contacts')
end

put '/contacts/:id' do
  @@rolodex.edit_contact(params[:id], params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to("/contacts/#{params[:id]}")
end

get '/contacts/:id' do
  @contact = @@rolodex.find("id", params[:id].to_i)[0]
  erb :show_contact
end

delete '/contacts/:id' do
  @contact = @@rolodex.remove_contact(params[:id].to_i)
  redirect to ("/contacts")
end




