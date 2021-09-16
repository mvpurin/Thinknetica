puts "Введите коэффициент a"
a = gets.chomp.to_f

puts "Введите коэффициент b"
b = gets.chomp.to_f

puts "Введите коэффициент c"
c = gets.chomp.to_f

D = b**2 - 4 * a * c

if D > 0
  puts "D = #{D}, x1 = #{(-b + Math.sqrt(D)) / (2 * a)}
  x2 = #{(-b - Math.sqrt(D)) / (2 * a)}"
elsif D == 0
  puts "D = #{D}, x = #{-b / (2 * a)}"
else
  puts "D = #{D}, корней нет!"
end