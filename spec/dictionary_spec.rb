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
  describe '#save' do
    it 'should save the instance in the terms array' do
      new_term = Term.new("banana", "is a yellow fruit")
      new_term.save
      Term.all.should eq [new_term]
    end
  end

  # describe '.list_words' do
  #   it 'should list all the words saved in the terms array' do
  #     new_term = Term.new("apple", "is a red fruit")
  #     new_term.save
  #     new_term = Term.create("banana", "is a yellow fruit")
  #     new_term.save
  #     Term.list_words.should eq "apple" + ", " + "banana"
  #   end
  # end

end
