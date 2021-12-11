octopuses = DATA.read.each_line.map { |line| line.strip.each_char.map { Integer(_1) } }

MAX_GRID_POS_X = octopuses.first.count - 1
MAX_GRID_POS_Y = octopuses.count - 1

def adjecent(x, y)
  x_range = (x > 0 ? x - 1 : x)..(x < MAX_GRID_POS_X ? x + 1 : x)
  y_range = (y > 0 ? y - 1 : y)..(y < MAX_GRID_POS_Y ? y + 1 : y)
  x_range.to_a.product(y_range.to_a) - [x, y]
end

State = Struct.new(:data, :flashes)

def tick(state)
  queue = (0..MAX_GRID_POS_X).to_a.product((0..MAX_GRID_POS_Y).to_a)

  queue.each { |(x, y)| state.data[x][y] += 1 }

  while queue.count > 0
    (x, y) = queue.shift
    next unless state.data[x][y] > 9

    state.data[x][y] = 0
    state.flashes += 1

    adjecent(x, y).each do |ax, ay|
      next if state.data[ax][ay] == 0

      state.data[ax][ay] += 1
      queue.push([ax, ay])
    end
  end
end

# Part 1

result = 100.times.each_with_object(State.new(octopuses.map(&:dup).dup, 0)) do |iteration, state|
  tick(state)
end

puts "Number of flashes after 100 iterations: #{result.flashes}"

# Part 2

first_all_flash_iteration = (1...).each_with_object(State.new(octopuses.map(&:dup).dup, 0)) do |iteration, state|
  tick(state)

  break iteration if state.data.flatten.uniq == [0]
end

puts "Everyone flashed at step #{first_all_flash_iteration}"

__END__
4112256372
3143253712
4516848631
3783477137
3746723582
5861358884
4843351774
2316447621
6643817745
6366815868
