# read file
file = File.open('input.txt')

# put content of file in array
file_array = file.readlines

# parse first and last numbers from each line
calibrations = file_array.map do |line|
  numbers = line.scan(/\d/)
  "#{numbers[0]}#{numbers[-1]}".to_i
end

# sum all calibrations
puts 'Part 1: ', calibrations.sum

# part 2
def word_to_digit(word)
  words_to_digits = {
    'one' => '1',
    'two' => '2',
    'three' => '3',
    'four' => '4',
    'five' => '5',
    'six' => '6',
    'seven' => '7',
    'eight' => '8',
    'nine' => '9'
  }
  words_to_digits[word]
end

calibrations2 = file_array.map do |line|
  numbers = line.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/).flatten

  first_number = numbers.first.match?(/\d/) ? numbers.first : word_to_digit(numbers.first)
  last_number = numbers.last.match?(/\d/) ? numbers.last : word_to_digit(numbers.last)

  "#{first_number}#{last_number}".to_i
end

puts 'Part 2: ', calibrations2.sum
