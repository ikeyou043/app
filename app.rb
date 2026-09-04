# frozen_string_literal: true

require 'sinatra'
require 'json'
enable :method_override
set :erb, escape_html: true

DB_PATH = File.join(__dir__, 'db', 'memos.json')

def load_memos
  json_string = File.read(DB_PATH)
  memos = JSON.parse(json_string, symbolize_names: true)
  memos.transform_keys(&:to_s)
end

def save_memos(memos)
  json_string = JSON.pretty_generate(memos)
  File.write(DB_PATH, json_string)
end

get '/' do
  @memos = load_memos
  erb :index
end

get '/memos/new' do
  erb :new
end

get '/memos/:id' do
  memos = load_memos

  @memo = memos[params[:id]]
  erb :show
end

post '/memos' do
  memos = load_memos
  new_id = (memos.keys.map(&:to_i).max + 1).to_s

  created_time = Time.now.strftime('%Y-%m-%d %H:%M')

  memos[new_id] = {
    title: params[:title],
    info: params[:info],
    tag: params[:tag],
    created_at: created_time
  }

  save_memos(memos)
  redirect '/'
end

get '/memos/:id/edit' do
  memos = load_memos
  @memo = memos[params[:id]]
  erb :edit
end

patch '/memos/:id' do
  memos = load_memos
  memo_id = params[:id]

  memos[memo_id][:title] = params[:title]
  memos[memo_id][:info]  = params[:info]
  memos[memo_id][:tag]   = params[:tag]

  save_memos(memos)
  redirect "/memos/#{memo_id}"
end

delete '/memos/:id' do
  memos = load_memos
  memo_id = params[:id]

  memos.delete(memo_id)
  save_memos(memos)

  redirect '/'
end
