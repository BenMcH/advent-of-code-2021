fish_counter = File.read('input.txt').split(',').map(&:to_i).group_by(&:itself).map { |k, v| [k, v.count] }.to_h

def set_fishes(fish_map, fish_index, amount)
	fish_map[fish_index] ||= 0
	fish_map[fish_index] += amount
end

def simulate_lantern_fish_day(fish_counter, days_to_simulate)
	new_fish_counter = {}

	fish_counter.keys.each do |fish|
		count = fish_counter[fish]

		if fish > 0
			set_fishes(new_fish_counter, fish - 1, count)
		elsif fish == 0
			set_fishes(new_fish_counter, 6, count)
			set_fishes(new_fish_counter, 8, count)
		end
	end

	return days_to_simulate == 1 ? new_fish_counter : simulate_lantern_fish_day(new_fish_counter, days_to_simulate - 1)
end

p simulate_lantern_fish_day(fish_counter, 80).values.sum
p simulate_lantern_fish_day(fish_counter, 250).values.sum
