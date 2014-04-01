require 'sinatra'

get '/' do
  @crm_app_name = "My CRM"
  erb :index
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


