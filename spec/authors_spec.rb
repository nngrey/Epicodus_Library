require 'spec_helper'

describe Authors do
  describe 'initialize' do
    it 'will initialize an instance of Author with a name.' do
    test_authors = Authors.new({:name => 'Samuel'})
    test_authors.should be_an_instance_of Authors
    test_authors.name.should eq 'Samuel'
    end
  end

  describe '#save' do
    it 'will save an author to the author array' do
      test_authors = Authors.new({:name => 'Samuel'})
      test_authors.save
      Authors.all.should eq [test_authors]
    end
  end

   describe '#delete' do
    it 'will delete an instance of Author' do
      test_author = Authors.new({:name => "Samuel"})
      test_author.save
      test_author.delete
      Authors.all.should eq []
    end
  end

  describe '#update' do
    it 'will edit an existing author and change it\'s name.' do
      test_author = Authors.new({:name => 'Samuel'})
      test_author.save
      test_author.update('Nathaniel')
      Authors.all[0].name.should eq 'Nathaniel'
    end
  end

  describe '.all' do
    it 'will start off as an empty array' do
      Authors.all.should eq []
    end
  end

    describe '.search' do
    it 'locates a book that is being searched for by author' do
      test_book = Book.new({:title => 'Ruby'})
      test_book.save
      test_author = Authors.new({:name => 'Ron'})
      test_author.save
      test_listing = Listing.new({:book_id => test_book.id, :author_id => test_author.id})
      test_listing.save
      Authors.search("Ron").should eq "Ruby"
    end
  end

  describe '==' do
    it 'will save only one instance if the names are the same' do
      test_author1 = Authors.new({:name => 'Bob'})
      test_author2 = Authors.new({:name => "Bob"})
      test_author1.should eq test_author2
    end
  end
end

