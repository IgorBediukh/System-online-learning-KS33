# Приклад поліморфізму
class Cat
  def make_sound
    puts "Cat meows"
  end
end

class Duck
  def make_sound
    puts "Duck quacks"
  end
end

# Використання поліморфізму
def make_some_noise(animal)
  animal.make_sound
end

cat = Cat.new
duck = Duck.new

make_some_noise(cat)  # Виведе "Cat meows"
make_some_noise(duck) # Виведе "Duck quacks"
