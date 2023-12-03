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

puts possible_games.keys.sum
