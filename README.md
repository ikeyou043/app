# メモアプリ

Sinatra製のシンプルなメモ管理アプリです。メモの一覧表示・詳細表示・追加・編集・削除ができます。

## 必要な環境

- Ruby 4.0.6
- Bundler

## セットアップ

```bash
git clone https://github.com/ikeyou043/app.git
cd app
bundle install
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
