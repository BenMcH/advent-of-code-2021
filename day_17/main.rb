Velocity = Struct.new(:x, :y)

def get_max_y(velocity, target_x, target_y)
	pos = Velocity.new(0, 0)
	max_y = pos.y

	mid_x = target_x.min + (target_x.max - target_x.min) / 2
	mid_y = target_y.min + (target_y.max - target_y.min) / 2

	mid_point = Velocity.new(mid_x, mid_y)

	while pos.y > target_y.min
		pos.x += velocity.x
		pos.y += velocity.y

		max_y = pos.y if pos.y > max_y

		return max_y if target_x.include?(pos.x) && target_y.include?(pos.y)

		if velocity.x > 0
			velocity.x -= 1
		elsif velocity.x < 0
			velocity.x += 1
		end

		velocity.y -= 1

		return -Float::INFINITY if (velocity.y < 0 && pos.y < target_y.min) || (velocity.x > 0 && pos.x > target_x.max) || (velocity.x < 0 && pos.x < target_x.min) || (velocity.x == 0 && !target_x.include?(pos.x))
	end

	return -Float::INFINITY
end

def part_1(input)
	input = input['target area: '.length..-1]

	x, y = input.split(', ')

	x_range = parse_range(x)
	y_range = parse_range(y)

	(-1000..1000).flat_map do |x|
		(-1000..1000).map do |y|
			velocity = Velocity.new(x, y)
			get_max_y(Velocity.new(x, y), x_range, y_range)
		end
	end
end

def parse_range(input)
	min, max = input[2..-1].split('..').map(&:to_i).minmax

	min..max
end

example_input = File.read('example.txt').strip

ex = part_1(example_input)
throw Exception.new("Part 1 is not 45, got: #{ex.max}" ) if 45 != ex.max
p 'passed part 1'

input = File.read('input.txt').strip

ans = part_1(input)
p ans.max

ex_count = ex.count {|x| x > -Float::INFINITY}

throw Exception.new("Part 2 is not 112, got: #{ex_count}" ) if 112 != ex_count

count = ans.count{|x| x > -Float::INFINITY}
p count
