require 'sinatra'
require 'sinatra/reloader'

set :bind, '0.0.0.0'  # bind to all interfaces

configure :development, :test do
  require 'pry'
end

get '/' do
  erb :index
end

post '/' do
  if params[:recipe_name].empty?
    erb :error
  else
    @is_delicious = is_delicious?(params[:recipe_name])
    @recipe_name = params[:recipe_name]
    erb :results
  end
end

def is_delicious?(recipe_name)
  recipe_name.downcase.include?("pickled beets")
end
