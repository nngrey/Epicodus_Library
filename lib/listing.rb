class Listing

attr_reader :book_id, :author_id

  def initialize(attributes)
    @book_id = attributes[:book_id]
    @author_id = attributes[:author_id]
  end

  def save
    DB.exec("INSERT INTO listings (book_id, author_id) VALUES (#{@book_id}, #{@author_id});")
  end

  def self.all
    results = DB.exec("SELECT * FROM listings;")
    listings_array = []
    results.each do |listing|
      book_id = listing['book_id'].to_i
      author_id = listing['author_id'].to_i
      listings_array << Listing.new({:book_id => book_id, :author_id => author_id})
    end
    listings_array
  end

  def ==(another_listing)
    self.book_id == another_listing.book_id && self.author_id == another_listing.author_id
  end
end

