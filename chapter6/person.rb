class Person
  attr_reader :mother, :children, :name

  def initialize(name, date_of_birth, date_of_death = nil, mother = nil)
    @name = name
    @date_of_birth = date_of_birth
    @date_of_death = date_of_death
    @mother = mother
    @children = []
    @mother.add_child(self) if @mother
  end

  def add_child(child)
    @children << child
  end

  def number_of_descendants_named(name)
    count_descendants_matching { |descendant| descendant.name == name }
  end

  def number_of_living_descendants
    count_descendants_matching(&:alive?)
  end

  protected

  def count_descendants_matching(name)
    children.inject(0) do |count, child|
      count += 1 if yield child
      count + child.count_descendants_matching(name)
    end
  end

  def alive?
    @date_of_death.nil?
  end
end
