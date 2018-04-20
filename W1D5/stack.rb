class Stack
  def initialize
    @data = []
  end

  def add(el)
    @data.push(el)
  end

  def remove
    @data.pop
  end

  def show
    @data.dup
  end
end
