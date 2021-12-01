input = File.read('input.txt').split("\n").map(&:to_i)

new_ary = []
greater = 0
greater_2 = 0

arr.each.with_index do |n, i|
	next if i == 0

	greater += 1 if n > arr[i - 1]

	if i >= 2
		new_ary << input[i-2..i].sum

		greater_2 += 1 if new_ary.length > 1 && new_ary[-1] > new_ary[-2]
	end
end

p greater, greater_2
