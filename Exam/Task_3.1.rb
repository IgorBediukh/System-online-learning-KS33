# Приклад cпадкування
class Animal
  def speak
    puts "Animal speaks"
  end
end

class Dog < Animal
  def speak
    puts "Dog barks"
  end
end

# Використання спадкування
animal = Animal.new
animal.speak  # Виведе "Animal speaks"

dog = Dog.new
dog.speak     # Виведе "Dog barks"
