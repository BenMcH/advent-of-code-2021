input = File.read('input.txt').split(',').map(&:to_i)

def fuel_used_to_align_subs(subs, index)
	fuel = 0
	subs.each do |sub|
		fuel += (sub - index).abs
	end
	fuel
end

def fuel_used_to_align_subs_pt2(subs, index)
	fuel = 0
	subs.each do |sub|
		moves = (sub - index).abs
		x = 1
		moves.times do
			fuel += x
			x += 1
		end
	end
	fuel
end

min = input.min
max = input.max
range = min..max

results = range.map do |target|
	fuel_used_to_align_subs(input, target)
end

p results.min

results = range.map do |target|
	fuel_used_to_align_subs_pt2(input, target)
end

p results.min
