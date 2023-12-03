input = File.readlines('input.txt', chomp: true)

def convert_string_to_hash(input_string)
  game_id = input_string[/\d+/].to_i

  regex_pattern = /(\d+)\s+(\w+)/

  colors_array = input_string.split(';').map do |part|
    part.scan(regex_pattern).each_with_object({}) do |(count, color), hash|
      hash[color.to_sym] = count.to_i
    end
  end

  { game_id => colors_array }
end

games = input.inject({}) { |m, e| m.merge(convert_string_to_hash(e)) }

possible_games = games.select do |_, game|
  game.all? do |set|
    (set[:red] || 0) <= 12 && (set[:green] || 0) <= 13 && (set[:blue] || 0) <= 14
  end
end

puts 'Part 1: ', possible_games.keys.sum

def calculate_product(game)
  game.last.each_with_object({ red: 0, blue: 0, green: 0 }) do |hash, acc|
    acc[:red] = [acc[:red], hash[:red] || 0].max
    acc[:blue] = [acc[:blue], hash[:blue] || 0].max
    acc[:green] = [acc[:green], hash[:green] || 0].max
    acc
  end.values.inject(:*)
end

puts 'Part 2: ', games.map { |game| calculate_product(game) }.sum
