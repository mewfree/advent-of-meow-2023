input = File.readlines('input.txt', chomp: true)

t = input.map do |line|
  _, numbers = line.strip.split(':')
  sets = numbers.split('|').map { |group| group.split.map(&:to_i).to_set }
  sets
end

v = t.map do |i|
  subset = i.first & i.last
  if subset.empty?
    0
  else
    2**(subset.length - 1)
  end
end

puts v.sum
