require './lib/dictionary'

def main_menu
  puts "Press 'a' to add a new term to the dictionary"
  puts "Press 'l' to list all terms in the dictionary"

  main_choice = gets.chomp

  if main_choice == 'a'
    puts "What is the word?"
    word_input = gets.chomp
    puts "What is the definition of that word?"
    definition_input = gets.chomp
    new_term = Term.create(word_input, definition_input)
    puts "You have added #{new_term.word} to the dictionary."
    main_menu
  elsif main_choice == 'l'
    Term.all.each do |term|
      puts term.word + " " + term.definition
      end
      main_menu
    else
    main_menu
  end
end

main_menu
