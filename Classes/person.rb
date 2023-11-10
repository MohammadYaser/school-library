require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(id, age = 18, name: 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(1)
puts person.id # Retrieves the id
puts person.name # Retrieves the name
puts person.age # Retrieves the age

person.name = 'Alice' # Sets a new name
person.age = 25 # Sets a new age
puts person.name # Retrieves the updated name
puts person.age # Retrieves the updated age
