@dice = 0

def rollDeterministic
	@dice = 0 if @dice == 100
	@dice = @dice + 1

	@dice
end

def play_deterministic(p1_loc, p2_loc, prefix = "")
	player = 0
	rolls = 0
	locations = [p1_loc, p2_loc]
	scores = [0, 0]
	until scores.max >= 1000
		3.times do
			locations[player] = locations[player] + rollDeterministic

			locations[player] -= 10 until locations[player] <= 10
		end
		rolls += 3
		scores[player] += locations[player]
		player = (player + 1) % 2
	end

  "#{prefix}#{scores.min * rolls}"
end

puts play_deterministic(4, 8, 'Example: ')
puts play_deterministic(4, 7)
