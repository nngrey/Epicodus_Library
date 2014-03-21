require 'pry'

class Book

  attr_reader :title, :id

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def save
    results = DB.exec("INSERT INTO books (title) VALUES ('#{@title}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    DB.exec("DELETE FROM books WHERE title = ('#{title}');")
  end

  def update(new_title)
    DB.exec("UPDATE books SET title = '#{new_title}' WHERE id = #{self.id};")
  end

  def self.all
    results = DB.exec("SELECT * FROM books;")
    books_array = []
    results.each do |book|
      title = book['title']
      id = book['id']
      books_array << Book.new({:title => title, :id => id})
    end
    books_array
  end

  def ==(another_book)
    self.title == another_book.title
  end
end
