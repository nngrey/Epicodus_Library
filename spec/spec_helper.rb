require 'rspec'
require 'book'
require 'authors'
require 'listing'
require 'pg'

DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM authors *;")
    DB.exec("DELETE FROM listings *;")
  end
end
