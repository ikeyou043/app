# frozen_string_literal: true

class Memo
  def self.all
    DB.exec('SELECT * FROM memos ORDER BY id;')
  end

  def self.create(title, info, tag)
    DB.exec_params('INSERT INTO memos (title, info, tag) VALUES ($1, $2, $3)', [title, info, tag])
  end

  def self.find(id)
    result = DB.exec_params('SELECT * FROM memos WHERE id = $1', [id])
    result.first
  end

  def self.update(title, info, tag, id)
    DB.exec_params('UPDATE memos SET title = $1, info = $2, tag = $3 WHERE id = $4', [title, info, tag, id])
  end

  def self.delete(id)
    DB.exec_params('DELETE FROM memos WHERE id = $1', [id])
  end
end
