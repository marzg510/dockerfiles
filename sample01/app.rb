require 'sinatra'
require "sinatra/json"
require 'json'

get '/sample.json' do
  json get_json("response/sample.json")
end

def get_json(path)
  File.open(path) do |file|
    JSON.load(file)
  end
end
