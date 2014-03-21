class Authors

attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def save
    results = DB.exec("INSERT INTO authors (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    DB.exec("DELETE FROM authors WHERE name = ('#{name}');")
  end

  def update(new_name)
    DB.exec("UPDATE authors SET name = '#{new_name}' WHERE id = #{self.id};")
  end

  def self.all
    results = DB.exec("SELECT * FROM authors;")
    authors_array = []
    results.each do |author|
      name = author['name']
      id = author['id']
      authors_array << Authors.new({:name => name, :id => id})
    end
    authors_array
  end

  # def self.search(title)
  #   results = DB.exec("SELECT books.* FROM authors JOIN listings ON (authors.id = listings.author_id) JOIN books on (listings.book_id = books.id) WHERE authors.id = 3;")
  #   binding.pry
  # end

  def ==(another_author)
    self.name == another_author.name
  end
end
