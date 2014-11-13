#‘app.rb‘ is the meat of the whole project, it’s your entire Sinatra app and will contain much more logic soon.
#Gemfile manages your gems, and must be up to date before you can deploy to Heroku.
#‘config.ru‘ helps Heroku run your app, Heroku will consider your Sinatra app to be the same as any other Rack-based ruby app
# and deploy it by following the instructions in config.ru.

require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/model'        #Model class

get '/' do
	erb :index
end

post '/submit' do
	@model = Model.new(params[:model])
	if @model.save
		redirect '/models'
	else
		"Sorry, there was an error!"
	end
end

get '/models' do
	@models = Model.all
	erb :models
end
