array = Array.new
array.push(0, 1)
i = 1
for i in 2..100
    array[i] = array[i-2] + array [i-1]
    if array[i] > 100
      array.delete_at(i)
      puts array
      break
    elsif array[i] == 100
      puts array
      break
    end
end
