# frozen_string_literal: true

require 'sinatra'
enable :method_override

MEMOS = {
  '1' => { title: '明日の予定', info: '明日は出張', tag: '仕事', created_at: '2026/09/03' },
  '2' => { title: '週末の予定', info: '週末はランチ', tag: 'プライベート', created_at: '2026/09/03' },
  '3' => { title: '上田綺世移籍', info: '上田綺世リールへ移籍', tag: 'ニュース', created_at: '2026/09/03' }
}
get '/' do
  @memos = MEMOS
  erb :index
end

get '/memos/new' do
  erb :new
end

get '/memos/:id' do
  memo_id = params[:id]

  @memo = MEMOS[memo_id]
  erb :show
end

post '/memos' do
  new_id = (MEMOS.keys.map(&:to_i).max + 1).to_s

  created_time = Time.now.strftime('%Y-%m-%d %H:%M')

  MEMOS[new_id] = {
    title: params[:title],
    info: params[:info],
    tag: params[:tag],
    created_at: created_time
  }

  redirect '/'
end

get '/memos/:id/edit' do
  @memo = MEMOS[params[:id]]
  erb :edit
end

post '/memos/:id' do
  memo_id = params[:id]

  MEMOS[memo_id][:title] = params[:title]
  MEMOS[memo_id][:info]  = params[:info]
  MEMOS[memo_id][:tag]   = params[:tag]

  redirect "/memos/#{memo_id}"
end

delete '/memos/:id' do
  memo_id = params[:id]

  MEMOS.delete(memo_id)

  redirect '/'
end
