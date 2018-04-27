require "byebug"

class LRUCache
  attr_reader :cache
  def initialize
    @cache = [nil,nil,nil,nil]
  end

  def count
    #returns number of elements in LRUCache
    @cache.count{|el| !el.nil?}
  end

  def add(el)
    p "adding"
    #debugger
    @cache.unshift(el)
    @cache = @cache.uniq
    @cache.pop if @cache.length > 4
    my_shift
    #ADDS elemnent to LRUCache according to LRU principle\
    el
  end

  def show
    @cache.each do |el|
      p el unless el.nil?
    end

    #shows the items in the cache with the LRU item FIRST
  end

  private
  #helper methods here
  def need_shifting?
    non_nil = false
    @cache.each do |el|
      non_nil = true unless el.nil?
      return true if non_nil && el.nil?
    end
  end

  def my_shift
    @cache = @cache.compact
    until @cache.length == 4
      @cache.unshift(nil)
    end
  end


  #helper methods go here!
end

class DemoClass
  def initialize
    @name = "hi"
  end
end


# c = LRUCache.New
#
# things = ["string", ['a','r','r','a','y'],1001, {"hash" => true}]
#
# things.each do |el|
#   c.add(el)
# end
# c.show
