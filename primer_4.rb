alphabet = ('a'..'z').to_a
letters = Hash.new
vowels = ['a', 'e', 'i', 'o', 'u', 'y']
alphabet.each do |letter|
  if vowels.include?(letter)
    letters[letter] = alphabet.index(letter) + 1
  end
end
puts letters
