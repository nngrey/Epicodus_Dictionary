require './lib/dictionary'
@current_term

def main_menu
  puts "\nPress 'a' to add a new term to the dictionary"
  puts "Press 's' to search the dictionary for a word"
  puts "Press 'l' to list all terms in the dictionary"
  puts "Press 'e' to edit a term"
  puts "Press 'd' to add an additional definition to the word"
  puts "Press 'x' to exit\n"

  main_choice = gets.chomp

  if main_choice == 'a'
    definitions_array = []
    puts "\nWhat is the word?"
    word_input = gets.chomp
    puts "\nWhat is the definition?"
    definition_input = gets.chomp
    definitions_array << definition_input
    new_term = Term.create(word_input, definitions_array)
    puts "\nYou have added #{new_term.word} to the dictionary."
    main_menu
  elsif main_choice == 's'
    puts "\nWhat word are you looking for?"
    user_input = gets.chomp
    current_term = Term.search(user_input)
    puts "\nResults -> " + current_term.word + ": " + current_term.definition
    main_menu
  elsif main_choice == 'l'
    list_terms
    main_menu
  elsif main_choice == 'e'
    edit_delete
  elsif main_choice == 'd'
    add_definition
  elsif main_choice == 'x'
    puts "Goodbye"
  else
    main_menu
  end
end

def list_terms
  terms_array = []
  Term.all.each_with_index do |term, index|
    terms_array.push("#{index + 1}" + ". " + term.word + ": " + term.definition.to_s)
  end
  puts terms_array
end

def edit_delete
  list_terms
  puts "\nSelect the number of the term you want to edit or delete"
  edit_selection = gets.chomp.to_i
  current_term = Term.all[edit_selection - 1]
  puts current_term.word + ": " + current_term.definition
  puts "\nEnter 'w' to edit the word or 'd' to edit the description or 'x' to delete both"
  user_choice = gets.chomp

  if user_choice == 'w'
    puts "\nEnter new word"
    new_word = gets.chomp
    current_term.word_edit(new_word)
    puts "\nHere is your updated term"
    puts current_term.word + ": " + current_term.definition
    main_menu
  elsif user_choice == 'd'
    puts "\nEnter a new definition"
    new_definition = gets.chomp
    current_term.definition_edit(new_definition)
    puts "\nHere is your updated term"
    puts current_term.word + ": " + current_term.definition
    main_menu
  elsif
    user_choice == 'x'
    Term.delete(edit_selection - 1)
    puts "You have deleted " + current_term.word
    main_menu
  end
end

 def add_definition
  list_terms
  puts "\nSelect the number of the term you want to add a definition to"
  edit_selection = gets.chomp.to_i
  current_term = Term.all[edit_selection - 1]
  puts "What is the additional definition?"
  additional_definition = gets.chomp
  current_term.add_definition(additional_definition)
  puts current_term.word + ": " + current_term.definition.to_s
  main_menu
end

main_menu
