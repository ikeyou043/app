# メモアプリ

Sinatra製のシンプルなメモ管理アプリです。メモの一覧表示・詳細表示・追加・編集・削除ができます。

## 必要な環境

- Ruby 4.0.6
- Bundler
- PostgreSQL(自分のマシンにインストール済みであること)

## セットアップ

```bash
git clone https://github.com/ikeyou043/app.git
cd app
bundle install
```

### データベースの作成

`db/create_tables.sql` に、データベース(`memo_app`)とテーブル(`memos`)を作成するDDLが入っています。以下のコマンドで適用してください。

```bash
psql postgres -f db/create_tables.sql
```

## 起動方法

```bash
bundle exec ruby app.rb
```

起動後、ブラウザで以下にアクセスしてください。

```
http://localhost:4567
```

## RuboCopの実行

```bash
bundle exec rubocop
```

## ERB Lintの実行

```bash
bundle exec erb_lint --lint-all
```
