# app.rb
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class LibraryApp
  attr_accessor :library_books, :library_people, :rentals

  def initialize
    @library_books = []
    @rentals = []
    @library_people = []
  end

  def display_books
    @library_books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def display_books_with_index
    @library_books.each_with_index { |book, i| puts "#{i}) Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def display_people
    @library_people.each do |person|
      puts "[#{person.class.name}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
  end

  def display_people_with_index
    @library_people.each_with_index do |person, i|
      puts "#{i}) [#{person.class.name}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_library_member
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    member_type = gets.chomp.to_i
    case member_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts "Error: Invalid option value (#{member_type})"
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp.to_s

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase

    if parent_permission =~ /^[Yy]/
      library_member = Student.new(age, name, parent_permission: true)
    elsif parent_permission =~ /^[Nn]/
      library_member = Student.new(age, name, parent_permission: false)
    else
      puts "Error: Invalid option value (#{parent_permission})"
      return
    end

    @library_people << library_member

    puts 'Library member created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp.to_s

    print 'Specialization: '
    specialization = gets.chomp.to_s

    @library_people << Teacher.new(age, name, specialization)

    puts 'Library member created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp.to_s

    print 'Author: '
    author = gets.chomp.to_s

    @library_books << Book.new(title, author)

    puts 'Book created successfully'
  end

  def create_library_rental
    puts 'Select a book from the following list by number'
    display_books_with_index
    book_index = gets.chomp.to_i
    unless (0...@library_books.length).include?(book_index)
      puts "Can not add a record. Book #{book_index} doesn't exist"
      return
    end
    book = @library_books[book_index]
    puts "\nSelect a person from the following list by number (not id)"
    display_people_with_index
    person_index = gets.chomp.to_i
    unless (0...@library_people.length).include?(person_index)
      puts "Can not add a record. Person #{person_index} doesn't exist"
      return
    end
    person = @library_people[person_index]
    print 'Date: '
    date = gets.chomp.to_s

    @rentals << Rental.new(date, book, person)
    puts 'Rental created successfully'
  end

  def display_person_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    selected = @rentals.find_all { |rental| rental.person.id == id }
    if selected.empty?
      puts "Person with id=#{id} doesn't exist"
      return
    end
    puts 'Rentals:'
    selected.map { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
  end

  def run
    start_user_interaction
  end

  private

  def start_user_interaction
    puts 'Welcome to the Library App!'
    loop do
      display_menu
      option = gets.chomp.to_i
      break if option == 7

      process_user_option(option)
    end
  end

  def display_menu
    puts "\nPlease choose an option by entering a number:
    1 - List all books
    2 - List all library members
    3 - Create a library member
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given library member id
    7 - Exit"
  end

  def process_user_option(option)
    case option
    when 1
      display_books
    when 2
      display_people
    when 3
      create_library_member
    when 4
      create_book
    when 5
      create_library_rental
    when 6
      display_person_rentals
    else
      puts 'Choose a number between 1 and 7'
    end
  end
end
