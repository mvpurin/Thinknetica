items = Array.new
prices = Array.new
amounts = Array.new

loop do

  puts "Введите название товара"
  item = gets.chomp

  items = items.push(item)

  break if item == "stop"

  puts "Введите цену за единицу товара"
  price = gets.chomp.to_f

  prices = prices.push(price)

  puts "Введите количество купленного товара"
  amount = gets.chomp.to_f

  amounts = amounts.push(amount)

end

items.delete("stop")

hash = Hash.new

#Создаем вложенный хэш {цена за единицу товара => кол-во товара}
n = 0
prices.each do |i|
    hash[i] = amounts[n]
    n += 1
end

#Создаем основной хэш {Название товара => [цена за единицу товара => кол-во товара]}
hashhash = Hash.new


array = hash.to_a

n = 0
items.each do |i|
  hashhash[i] = array[n]
  n += 1
end

#Создаем основной хэш {Название товара => {цена за единицу товара => кол-во товара}}
jj = Hash.new

hashhash.each do |key, value|
  hh = {hashhash[key][0] => hashhash[key][1]}
  jj[key] = hh
end

sum = 0
# Определим итоговую сумму за каждый товар
jj.each do |key, value|
  value.each do |i, j|
    sum = sum + i * j
    puts "Итоговая сумма за товар #{key} составила #{i*j}"
  end
end
puts "Итоговая сумма всех покупок составила #{sum}"
