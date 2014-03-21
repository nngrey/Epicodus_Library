require 'spec_helper'

describe Book do
  describe 'initialize' do
    it 'will initialize an instance of Book with a title and an id.' do
    test_book = Book.new({:title => 'Ruby'})
    test_book.should be_an_instance_of Book
    test_book.title.should eq 'Ruby'
    end
  end

  describe '#save' do
    it 'will save and instance of Book to an array of all instances' do
      test_book = Book.new({:title => "Ruby"})
      test_book.save
      Book.all.should eq [test_book]
    end
  end

  describe '#delete' do
    it 'will delete an instance of Book' do
      test_book = Book.new({:title => "Ruby"})
      test_book.save
      test_book.delete
      Book.all.should eq []
    end
  end

  describe '#update' do
    it 'will edit an existing book and change it\'s title.' do
      test_book = Book.new({:title => 'Ruby'})
      test_book.save
      test_book.update('Javascript')
      Book.all[0].title.should eq 'Javascript'
    end
  end

  describe '==' do
    it 'will only keep one book if the title is the same' do
      test_book1 = Book.new({:title => 'Ruby'})
      test_book2 = Book.new({:title => 'Ruby'})
      test_book1.should eq test_book2
    end
  end

  describe '.all' do
    it 'starts off as an empty array' do
      Book.all.should eq []
    end
  end

  # describe '.search' do
  #   it 'locates a book that is being searched for' do
  #     test_book = Book.new({:title => 'Ruby'})
  #     test_book.save
  #     Book.search("Ruby").should eq [test_book]
  #   end
  # end
end

