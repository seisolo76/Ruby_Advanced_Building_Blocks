def bubble_sort(array)
n = array.length
m = n

puts "array length = #{n}"
  begin
   swapped = false
    for i in 0..m-2 do
      j = i+1
      array[i],array[j] = array[j],array[i] if array[i] > array[j] 
      #print array
      #puts swapped
      swapped = true
    end
    m -= 1
end until swapped == false
print array
end

test = [8,4,6,3,5,2,9,1,7]
puts bubble_sort(test)




def bubble_sort_by(array)
n = array.length
m = n

puts "array length = #{n}"
  begin
   swapped = false
    for i in 0..m-2 do
      j = i+1
      array[i],array[j] = array[j],array[i] if (yield(array[i], array[j]) > 0) 
      #print array
      #puts swapped
      swapped = true
    end
    m -= 1
end until swapped == false
print array
end


bubble_sort_by(["hi","hello","hey"]) do |left,right|
     left.length - right.length
end
