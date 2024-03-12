class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_recursive(@root, value)
  end

  def search(value)
    search_recursive(@root, value)
  end

  private

  def insert_recursive(node, value)
    return Node.new(value) if node.nil?

    if value < node.value
      node.left = insert_recursive(node.left, value)
    elsif value > node.value
      node.right = insert_recursive(node.right, value)
    end

    node
  end

  def search_recursive(node, value)
    return false if node.nil?

    if value == node.value
      return true
    elsif value < node.value
      return search_recursive(node.left, value)
    else
      return search_recursive(node.right, value)
    end
  end
end

# Приклад використання:

# Створюємо бінарне дерево
tree = BinaryTree.new

# Додаємо елементи
tree.insert(5)
tree.insert(3)
tree.insert(7)
tree.insert(1)
tree.insert(4)

# Пошук елементу
puts tree.search(4) # Виведе true
puts tree.search(6) # Виведе false
