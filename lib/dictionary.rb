class Term

  @@terms = []

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def Term.clear
    @@terms = []
  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    new_term.save
    new_term
  end

  def Term.all
    @@terms
  end

  def Term.list_words
    @@terms.each do |term|
      p term.word
    end
  end

  def save
    @@terms << self
  end

  def word
    @word
  end

  def definition
    @definition
  end

end

      # new_term = Term.new("apple", "is a red fruit")
      # new_term.save
      # new_term = Term.create("banana", "is a yellow fruit")
      # new_term.save
      # new_term = Term.create("orange", "is an orange fruit")
      # new_term.save
      # Term.list_words


