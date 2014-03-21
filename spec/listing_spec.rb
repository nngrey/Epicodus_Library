require 'spec_helper'

describe Listing do
  describe 'initialize' do
    it 'will initialize an instance of Listing with a book_id and an author_id.' do
    test_listing = Listing.new({:book_id => 3, :author_id => 4})
    test_listing.should be_an_instance_of Listing
    end
  end

  describe '#save' do
    it 'will save a listing to the listing array' do
      test_listing = Listing.new({:book_id => 3, :author_id => 4})
      test_listing.save
      Listing.all.should eq [test_listing]
    end
  end

  # describe '#delete' do
  #   it 'will delete an instance of Author'
  #   test_author

  describe '.all' do
    it 'will start off as an empty array' do
      Listing.all.should eq []
    end
  end

  describe '==' do
    it 'will save only one instance if the names are the same' do
      test_listing1 = Listing.new({:book_id => 3, :author_id => 4})
      test_listing2 = Listing.new({:book_id => 3, :author_id => 4})
      test_listing1.should eq test_listing2
    end
  end
end

