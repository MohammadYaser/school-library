# main.rb
require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

# Create a person
person = Person.new(22, 'maximilianus')
puts person.correct_name

# Apply decorators directly to the person
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(person)
puts capitalized_trimmed_person.correct_name
