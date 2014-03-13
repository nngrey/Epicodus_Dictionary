require 'rspec'
require 'dictionary'

describe Term  do
  before do
    Term.clear
  end

  it 'is initialized with a word and a definition' do
    new_term = Term.new("apple", "a wonderful fruit")
    new_term.should be_an_instance_of Term
  end

  describe '.clear' do
    it 'empties out all of the saved terms' do
      Term.new("apple", "a red fruit").save
      Term.clear
      Term.all.should eq []
    end
  end

  describe ".create" do
    it 'creates a new instance of Term' do
      new_term = Term.new("apple", "a red fruit")
      new_term.should be_an_instance_of Term
    end

    it 'saves the term' do
      new_term = Term.create("apple", "a red fruit")
      Term.all.should eq [new_term]
    end
  end

  describe '.all' do
    it 'should be empty at first' do
      Term.all.should eq []
    end
  end

  describe ".delete" do
    it 'should delete an instance of a term' do
      new_term = Term.create("apple", "red")
      Term.delete(0).should eq []
    end
  end

  describe ".search" do
    it 'should search for and return a term in the dictionary' do
      new_term = Term.create("apple", "red")
      Term.search("apple").should eq Term.all[0]
    end
  end

  describe '#save' do
    it 'should save the instance in the terms array' do
      new_term = Term.new("banana", "is a yellow fruit")
      new_term.save
      Term.all.should eq [new_term]
    end
  end

  describe "#word_edit" do
    it 'should update the word' do
      new_term = Term.create("apple", "red")
      edited_term = new_term.word_edit("banana")
      edited_term.should eq new_term.word
    end
  end
end
