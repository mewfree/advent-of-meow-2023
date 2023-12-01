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
puts calibrations.sum
