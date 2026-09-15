class Memo
  def self.all
		DB.exec("SELECT * FROM memos;")
	end

	def self.create(title, info, tag)
		DB.exec_params("INSERT INTO memos (title, info, tag) VALUES ($1, $2, $3)", [title, info, tag])
	end
end
