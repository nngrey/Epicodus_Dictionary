class Term

  @@terms = []


  def initialize(word, definitions)
    @word = word
    @definitions_array = definitions

  end

  def Term.clear
    @@terms = []
  end

  def Term.create(word, definitions_array)
    new_term = Term.new(word, definitions_array)
    new_term.save
    new_term
  end

  def Term.search(word)
    @@terms.each do |term|
      if word == term.word
      return term
      end
    end
  end

  def word_edit(new_word)
    @word = new_word
  end

  def definition_edit(new_definition)
    @definition = new_definition
  end

  def Term.delete(index)
    @@terms.delete_at(index)
    @@terms
  end

  def Term.all
    @@terms
  end

  def save
    @@terms << self
  end

  def word
    @word
  end

  def definition
    @definitions_array
  end

  def add_definition(new_definition)
    @definitions_array << new_definition
  end
end

      # new_term = Term.new("apple", "is a red fruit")
      # new_term.save
      # new_term = Term.create("banana", "is a yellow fruit")
      # new_term.save
      # new_term = Term.create("orange", "is an orange fruit")
      # new_term.save
      # Term.list_words


