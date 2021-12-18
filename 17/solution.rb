matches = DATA.read.match(/x=(-?\d+)..(-?\d+), y=(-?\d+)..(-?\d+)/)
RANGE_X = Integer(matches[1])..Integer(matches[2])
RANGE_Y = Integer(matches[3])..Integer(matches[4])

def tick(pos:, speed:)= [
  [
    pos[0] + speed[0],
    pos[1] + speed[1]
  ],
  [
    speed[0] + (speed[0] == 0 ? 0 : (speed[0] < 0 ? 1 : -1)),
    speed[1] - 1
  ]
]

def run(speedx, speedy)
  speed = [speedx, speedy]
  pos = [0, 0]
  path = [pos]
  loop do
      pos, speed = *tick(pos: pos, speed: speed)
      path << pos

      return [true, path] if RANGE_X.cover?(pos[0]) && RANGE_Y.cover?(pos[1])
      return [false, path] if RANGE_X.last < pos[0] || RANGE_Y.first > pos[1]
  end
end

paths = 0.upto(RANGE_X.last).to_a
  .product(RANGE_Y.first.upto(RANGE_X.last + -1 * RANGE_Y.first).to_a) # somewhat randomly chosen values that should be big enough
  .map { |(speedx, speedy)| run(speedx, speedy) }
  .select { |(match, _)| match }
  .map(&:last)

# Part 1

puts "Higest y position reachable #{paths.map { _1.map(&:last).max }.max}"

# Part 2

puts "Distinct paths found: #{paths.count}"

__END__
target area: x=137..171, y=-98..-73
