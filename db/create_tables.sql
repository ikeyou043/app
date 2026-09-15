CREATE DATABASE memo_app;
\c memo_app
CREATE TABLE memos (
  id SERIAL PRIMARY KEY,
  title TEXT,
  info TEXT,
  tag TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
