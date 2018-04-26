
def sluggish(fish_array)

  fish_array.each do |examining|
    longest = true
    fish_array.each do |compare_to|
      longest = false if examining.length < compare_to.length
    end
    return examining if longest
  end
end

def dominant(fish)
  sorted = octo_merge_sort(fish)
  sorted.last
end

def octo_merge_sort(arr)
  return arr if arr.length <= 1
  middle = arr.length/2
  return octo_merge(arr.take(middle), arr.drop(middle))
end

def octo_merge(arr1, arr2)
  res = []
  until arr2.empty? || arr1.empty?
    el1 = arr1.first
    el2 = arr2.first
    if el1.length < el2.length
      res.unshift(arr1.shift)
    else
      res.unshift(arr2.shift)
    end
  end

  res + arr1 + arr2
end

def clever(fish_array)
  longest = fish_array.first
  fish_array.each do |fish|
    longest = fish if fish.length > longest.length
  end
  longest
end

def slow_dance(direction)
  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
  tiles_array.index(direction)
end

def constant_dance(direction)
  dance_hash = {
    "up" => 0,
    "up-right" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
     "left-up" => 7,
  }
  dance_hash[direction]
end
