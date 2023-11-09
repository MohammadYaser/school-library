require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id, specialization, age = 25, name: "Unknown", parent_permission: true)
    super(id, age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true # Override to always return true
  end
end
