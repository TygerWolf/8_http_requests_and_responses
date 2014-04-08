# require_relative 'rolodex'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact

  # attr_accessor :id
  # attr_accessor :first_name, :last_name, :email, :note

  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :note, String
end

DataMapper.finalize
DataMapper.auto_upgrade!


# def initialize(first_name, last_name, email, note)
#   @first_name = first_name
#   @last_name = last_name
#   @email = email
#   @note = note
# end

# def to_s
#   "ID: #{@id}\n First Name: #{@first_name}\n Last Name: #{@last_name}\n Email: #{@email}\n Notes:#{@note}"
# end

# end

# @@rolodex = Rolodex.new

# @@rolodex.add_new_contact(Contact.new("Sandeep", "Dhanjani", "sd@gmail.com", "What a guy!"))
# @@rolodex.add_new_contact(Contact.new("Matt", "Holtom", "matt@gmail.com", "What's up!"))

get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get "/contacts" do
  if params.empty?
    @contacts = Contact.all
  else
    @contacts = Contact.all(params[:trait] => params[:search_goal])
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
  @contact = Contact.get(params[:id].to_i)
  erb :edit_contact
end

get '/contacts/:id' do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

  # Contact.(params[:id], params[:first_name], params[:last_name], params[:email], params[:note])
  # @contacts = Contact.get
  # erb :contacts
# end

post '/contacts' do
  @contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :note => params[:note]
    )

  # new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  # @@rolodex.add_new_contact(new_contact)
  redirect to('/contacts')

end

put '/contacts/:id' do
  @contact = Contact.get(params[:id].to_i)
  @contact.first_name = params[:first_name]
  @contact.last_name = params[:last_name]
  @contact.email = params[:email]
  @contact.note = params[:note]
  @contact.save

  redirect to("/contacts/#{params[:id]}")
end

get '/contacts/:id' do
  @contact = Contact.find("id", params[:id].to_i)[0]
  erb :show_contact
end

delete '/contacts/:id' do
  @contact = Contact.get(params[:id].to_i)
  @contact.destroy
  redirect to ("/contacts")
end























