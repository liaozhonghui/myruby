def call_block (&block)
    block.call
end

def pass_block(&block)
    call_block(&block)
end

pass_block {puts "Hello, Block."}

class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end


ruby_tree = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacRuby")])
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

module ToFile
  def filename
    "object_#{self.object_id}.txt"
  end

  def to_f
    File.open(filename, 'w') {|f| f.write(to_s)}
  end
end

class Person include ToFile
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def to_s
    "write #{name} to file."
  end
end

Person.new('matz').to_f
