input_fish = File.read('input.txt').split(',').map(&:to_i)
days = 80

fish = input_fish.dup

for i in 0..(days - 1) do
	new_fish = []
	fish = fish.map do |x|
		if x == 0
			new_fish << 8
			6
		else
			x - 1
		end
	end

	fish.concat(new_fish)
end



p fish.length
