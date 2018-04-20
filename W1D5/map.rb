class Map
  def initialize
    @pairs = []
  end

  def keys
    @pairs.map{|pair| pair[0]}
  end

  def values
    @pairs.map{|pair| pair[1]}
  end

  def assign(k,v)
    if self.keys.include?(k)
      @pairs.each do |pair|
        pair[1] = v if pair[0]==k
      end
    else
      @pairs.push([k,v])
    end
  end

  def lookup(key)
    @pairs.each {|k,v| return v if k == key}
    nil
  end

  def remove(key)
    @pairs = @pairs.select {|k,v| k != key}
  end

  def show
    @pairs.dup
  end

end
