def build_polymers(polymers)
	polymers.split("\n").map do |x|
		a, b = x.split(' -> ')

		[a, "#{a[0]}#{b}#{a[1]}"]
	end.to_h
end

def step(str, polymers)
	str.each_cons(2).map.with_index do |a, i|
		start_index = i > 0 ? 1 : 0
		polymers[a.join][start_index..-1]
	end.join
end

def part_1(start, polymers)
	str = start.split('')

	polymers = build_polymers(polymers)

	10.times do |x|
		str = step(str, polymers).split('')
	end

	min, max = str.tally.to_a.map(&:last).minmax

	max - min
end

ex_start, ex_polymers = File.read('example.txt').split("\n\n")
ans = part_1(ex_start, ex_polymers)

throw Exception.new("Part 1 is not 1588, got: #{ans}" ) if 1588 != ans

start, polymers = File.read('input.txt').split("\n\n")

p part_1(start, polymers)

def part_2(start, polymers)
end

ans = part_2(ex_start, ex_polymers)
throw Exception.new("Part 2 is not 2188189693529, got: #{ans}") if ans != 2188189693529

p part_2(start, polymers)
