# frozen_string_literal: true

require 'sinatra'

MEMOS = {
  '1' => { title: '明日の予定', info: '明日は出張', tag: '仕事', created_at: '2026/09/03' },
  '2' => { title: '週末の予定', info: '週末はランチ', tag: 'プライベート', created_at: '2026/09/03' },
  '3' => { title: '上田綺世移籍', info: '上田綺世リールへ移籍', tag: 'ニュース', created_at: '2026/09/03' }
}.freeze

get '/' do
  @memos = MEMOS
  erb :index
end

get '/memos/:id' do
  memo_id = params[:id]

  @memo = MEMOS[memo_id]
  erb :show
end
