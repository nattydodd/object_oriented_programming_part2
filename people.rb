class Person

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi, my name is #{@name}."
  end

end

class Student < Person

  def learn
    puts "I get it!"
  end

end

class Instructor < Person

  def teach
    puts "Everthing in Ruby is an Object"
  end

end

chris = Instructor.new("Chris")
chris.greeting

cristina = Student.new("Cristina")
cristina.greeting

chris.teach

cristina.learn

cristina.teach
#This creates a "NoMethodError" because
# the .teach method only applies to the Instructor
# class. The Student class cannot access this method.
