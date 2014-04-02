require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

@@rolodex = Rolodex.new

get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get "/contacts" do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get '/contacts/:id' do
  erb :index
end

get '/contacts/:id/edit' do
  erb :index
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes])
  @@rolodex.add_new_contact(new_contact)
  redirect to ('/contacts')
end
# post '/' do
#   "this is a post"
# end

# get '/hello' do
#   "Hello World"
# end

# get '/bye' do
#   "Goodbye cruel world"
# end


