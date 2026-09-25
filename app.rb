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
  halt 404 unless params[:id] =~ /\A\d+\z/
  @memo = Memo.find(params[:id])
  halt 404 if @memo.nil?
  erb :show
end

post '/memos' do
  Memo.create(params[:title], params[:info], params[:tag])
  redirect '/memos'
end

get '/memos/:id/edit' do
  halt 404 unless params[:id] =~ /\A\d+\z/
  @memo = Memo.find(params[:id])
  halt 404 if @memo.nil?
  erb :edit
end

patch '/memos/:id' do
  halt 404 unless params[:id] =~ /\A\d+\z/
  memo_id = params[:id]
  @memo = Memo.find(memo_id)
  halt 404 if @memo.nil?

  Memo.update(params[:title], params[:info], params[:tag], memo_id)
  redirect "/memos/#{memo_id}"
end

delete '/memos/:id' do
  halt 404 unless params[:id] =~ /\A\d+\z/
  Memo.delete(params[:id])
  redirect '/memos'
end
