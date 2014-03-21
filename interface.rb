require 'pg'
require './lib/book.rb'
require './lib/authors.rb'
require './lib/listing.rb'
require 'pry'

DB = PG.connect({:dbname => 'library'})

def welcome_menu
  puts "*******************************************"
  puts "*  Welcome to Nathan & Marty's library!   *"
  puts "*******************************************"
  puts "*  Press l to enter the Librarian menu.   *"
  puts "*    Press p to enter the Patron menu.    *"
  puts "*           Press x to exit.              *"
  puts "*******************************************"

  main_choice = gets.chomp
    if main_choice == 'l'
      librarian_menu
    elsif main_choice == 'p'
      patron_menu
    elsif main_choice == 'x'
      puts "Thank you for your time!"
      exit
    else
      welcome_menu
    end
end

def librarian_menu
  puts "Welcome librarians!  Please enter your credentials and select from the following."
  puts "Please enter a to add a book."
  puts "Please enter u to update a book."
  puts "Please ented d to delete a book."
  puts "Please press l to get a current list of books."
  puts "Please press p if you are a patron to access the patron menu."
  puts "Please press x to exit."

  librarian_choice = gets.chomp
    if librarian_choice == 'a'
      book_id = add_book
      author_id = add_author
      add_listing(book_id, author_id)
    elsif librarian_choice == 'u'
      update_book
    elsif librarian_choice == 'd'
      #delete book
    elsif librarian_choice == 'l'
      #list books
    elsif librarian_choice == 'p'
      patron_menu
    elsif librarian_choice == 'x'
      exit
    else
      welcome_menu
    end
    welcome_menu
end

def add_book
  puts "Please enter the title of the book"
  title = gets.chomp
  new_book = Book.new({:title => title})
  book_id = new_book.save

  #new_id = new_book.save
  # new_book_title = DB.exec('Select * FROM books WHERE id = #{new_id};')
  # binding.pry
  # puts "You have added #{new_book_title}"
end
def add_author
  puts "Please enter the book's author"
  author_name = gets.chomp
  new_author = Authors.new(:name => author_name)
  author_id = new_author.save

end

def add_listing(book_id, author_id)
  new_listing = Listing.new(:book_id => book_id, :author_id => author_id)
  new_listing.save
end

def update_book
  puts "Please enter the title of the book you would like to update."
  title_input = gets.chomp

  Book.all.each do |book|
    if book.title = title_input
      puts "We have found your book"
      temp_book = book
      put "Please enter the new title"
      new_title = gets.chomp
      book.update(new_title)
    end

    Book.update(new_title)
  end

end

def patron_menu
  puts "Welcome patrons! Please choose from the following menu. Happy Reading!"
  puts "Please press c to check out a book."
  puts "Please press h to view your history."
  puts "Please predd d to see the due date for a currently withdrawn book."
end
welcome_menu
