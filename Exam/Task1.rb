# Елемент структури
class Element
  def accept(visitor)
    raise NotImplementedError, "#{self.class} does not implement accept method."
  end
end

# Конкретний елемент
class ConcreteElement < Element
  def accept(visitor)
    visitor.visit_concrete_element(self)
  end

  def operation
    # Операція, яку слід виконати над цим елементом
  end
end

# Відвідувач
class Visitor
  def visit_concrete_element(element)
    raise NotImplementedError, "#{self.class} does not implement visit_concrete_element method."
  end
end

# Конкретний відвідувач
class ConcreteVisitor < Visitor
  def visit_concrete_element(element)
    element.operation
    # Додаткові операції, які можна виконати над елементом
  end
end

# Клієнтський код
element = ConcreteElement.new
visitor = ConcreteVisitor.new
element.accept(visitor)
