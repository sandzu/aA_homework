class Queue
  def initialize
    @data = []
  end

  def enque(el)
    @data.push(el)
  end

  def deque
    @data.shift
  end

  def show
    @data.dup
  end
end
