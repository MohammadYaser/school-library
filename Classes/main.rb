require_relative 'app' # Assuming that 'app.rb' contains the LibraryApp class

def display_menu
  puts "\nPlease choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit"
end

def user_prompt
  puts 'Welcome to the Library Management System!'
  loop do
    display_menu
    option = gets.chomp.to_i
    break if option == 7

    process_user_choice(option)
  end
end

def process_user_choice(option)
  case option
  when 1
    display_books
  when 2
    display_library_members
  when 3
    add_library_member
  when 4
    add_book
  when 5
    add_rental
  when 6
    display_member_rentals
  else
    puts 'Choose a number between 1 and 7'
  end
end

def main_app
  library_app = LibraryApp.new
  library_app.run
end

main_app
