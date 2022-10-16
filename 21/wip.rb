INITIAL = DATA.read.split("\n").map { |line| Integer(line.split("position: ").last) }

# Part 1

PlayerPt1 = Struct.new(:pos, :score, :rolls)

def turn(player, die)
  pos = (player.pos - 1 + 3.times.map { die.call }.sum) % 10 + 1
  PlayerPt1.new(pos, player.score + pos, player.rolls + 3)
end

def build_deterministic_die(limit: 100)
  n = -1
  -> { ((n += 1) % limit) + 1 }
end

die_pt1 = build_deterministic_die
players_pt1 = INITIAL.map { PlayerPt1.new(_1, 0, 0) }
turn_pt1 = 0
until players_pt1.any? { _1.score >= 1000 }
  players_pt1[turn_pt1] = turn(players_pt1[turn_pt1], die_pt1)
  turn_pt1 = (turn_pt1 == 0 ? 1 : 0)
end

rolls = players_pt1.map(&:rolls).sum
lowscore = players_pt1.map(&:score).min
puts "Part 1: Rolls #{rolls} x Lowscore #{lowscore} = #{rolls * lowscore}"

# Part 2

PlayerPt2 = Struct.new(:pos, :score, :cardinality)

def turn_pt2(player, move, cardinality)
  pos = (player.pos - 1 + move) % 10 + 1
  PlayerPt2.new(pos, player.score + pos, player.cardinality * cardinality)
end

outcomes = [1,2,3].product([1,2,3]).product([1,2,3]).map(&:flatten).map(&:sum).tally

wins = { 0 => 0, 1 => 1 }

games = []
games << INITIAL.map { PlayerPt2.new(_1, 0, 1) }
while game = games.shift
  pp wins
  winner0s, rest0s = outcomes.map { turn_pt2(game[0], _1, _2) }.partition { _1.score >= 21 }
  wins[0] += winner0s.map(&:cardinality).sum

  rest0s.each do |player0|
    winner1s, rest1s = outcomes.map { turn_pt2(game[1], _1, _2) }.partition { _1.score >= 21 }
    wins[1] += winner1s.map(&:cardinality).sum

    rest1s.each { |player1| games << [player0, player1] }
  end
end

pp wins


__END__
Player 1 starting position: 4
Player 2 starting position: 8
