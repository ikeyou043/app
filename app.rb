# frozen_string_literal: true

require 'sinatra'
require 'pg'
require_relative 'models/memo'

enable :method_override
set :erb, escape_html: true

DB = PG.connect(dbname: 'memo_app')

get '/' do
  redirect '/memos'
end

get '/memos' do
  @memos = Memo.all
  erb :index
end

get '/memos/new' do
  erb :new
end

get '/memos/:id' do
  memos = Memo.find(params[:id])
  @memo = memos.first
  halt 404 if @memo.nil?
  erb :show
end

post '/memos' do
  Memo.create(params[:title], params[:info], params[:tag])
  redirect '/memos'
end

get '/memos/:id/edit' do
  memos = Memo.find(params[:id])
  @memo = memos.first
  halt 404 if @memo.nil?
  erb :edit
end

patch '/memos/:id' do
  memo_id = params[:id]
  memos = Memo.find(memo_id)
  @memo = memos.first
  halt 404 if @memo.nil?

  Memo.update(params[:title], params[:info], params[:tag], memo_id)
  redirect "/memos/#{memo_id}"
end

delete '/memos/:id' do
  Memo.delete(params[:id])
  redirect '/memos'
end
