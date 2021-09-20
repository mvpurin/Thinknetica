months = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
7 => 31, 8 =>31, 9 =>30, 10 => 31, 11 => 30, 12 => 31}

puts "Введите число, месяц и год"
date = gets.chomp

date = date.split(' ')

date = date.map {|x| x.to_f}

#Определяем число дней в феврале
if date[2] % 4 == 0
  months[2] = 29 #Високосный год
elsif
  date[2] % 100 == 0
  months[2] = 28 #Невисокосный год
elsif
  date[2] % 400 == 0
  months[2] = 29 #Високосный год
end

number = 0

months.each do |month, day|
  if month < date[1]
    number = number + day
  elsif month == date[1]
    number = number + date[0]
  end
end

puts number
