require 'json'
input = DATA.read.split("\n")


ExplodeState = Struct.new(:done, :prev, :carry)
def explode(snailnum, state: ExplodeState.new, depth: 0)
  snailnum.each_with_index do |v, idx|
    case v
    when Integer
      if state.carry
        snailnum[idx] += state.carry
        state.carry = nil
      else
        state.prev = ->(value) { snailnum[idx] += value }
      end
    when Array
      if depth <= 2 || state.done
        explode(v, state: state, depth: depth + 1)
      else
        snailnum[idx] = 0
        state.done = true
        state.prev.(v[0]) if state.prev
        state.carry = v[1]
      end
    end

    break if state.done && !state.carry
  end

  state.done
end

def split(snailnum, depth: 0)
  snailnum.each_with_index do
    if _1.is_a?(Integer) && _1 >= 10
      snailnum[_2] = [(_1 / 2.0).floor.to_i, (_1 / 2.0).ceil.to_i]
      return true
    end

    if _1.is_a?(Array) && split(_1, depth: depth + 1)
      return true
    end
  end

  false
end

def sum(snailnum1, snailnum2)= [snailnum1, snailnum2].tap do |res|
  loop do
    exploded = explode(res)
    splitted = split(res) unless exploded
    break unless exploded || splitted
  end
end

def magnitude(snailnum)
  if snailnum.is_a?(Array)
    magnitude(snailnum[0]) * 3 + magnitude(snailnum[1]) * 2
  else
    snailnum
  end
end

# Part 1

sum_part1 = input.map { JSON.parse(_1) }.inject { |ack, line| sum(ack, line) }
magnitude_part1 = magnitude(sum_part1)
puts "Magnitude of all input added: #{magnitude_part1}"

# Part 2

sums_part2 = input.permutation(2).map { sum(JSON.parse(_1), JSON.parse(_2)) }
magnitude_part2 = sums_part2.map { magnitude(_1) }.max
puts "Magnitude of best input combination: #{magnitude_part2}"

__END__
[[[3,9],[7,2]],[[8,4],[[5,6],0]]]
[[[1,[4,9]],[[1,8],[1,5]]],[[[2,6],[6,7]],[[4,6],[9,0]]]]
[[[[9,2],1],[[0,7],[9,6]]],[[5,9],[7,[6,9]]]]
[8,9]
[[4,[6,1]],[2,[[6,7],2]]]
[[6,[[4,1],5]],[4,9]]
[[[0,6],[8,[8,5]]],[6,9]]
[[0,[1,0]],[[8,[7,4]],[[1,1],[5,0]]]]
[[[1,[0,1]],6],[1,9]]
[[2,[[9,0],[6,1]]],[[8,4],[5,7]]]
[[[[5,3],[0,9]],[1,[0,7]]],[[9,0],[2,[2,0]]]]
[[2,[2,[6,8]]],[[9,[5,4]],[4,[3,4]]]]
[[[[4,0],[7,0]],[[4,8],[5,8]]],[[[7,2],[2,2]],[[3,3],3]]]
[[5,0],5]
[[8,[[5,0],2]],[6,[5,1]]]
[[[9,[8,8]],[8,7]],[[[4,2],4],[[5,1],[4,8]]]]
[[[[1,1],3],5],9]
[[[[1,7],[6,5]],5],[[0,6],0]]
[[9,6],2]
[[[2,[0,8]],[8,[2,1]]],5]
[[[9,[3,7]],3],[0,[5,9]]]
[[[2,[1,7]],6],[[7,[8,2]],[[8,2],8]]]
[[[[1,2],1],5],2]
[4,[8,[3,9]]]
[[[[8,9],[6,0]],[[1,6],7]],8]
[[2,[8,1]],3]
[[2,2],[[8,[0,2]],[[5,0],5]]]
[9,[2,[[6,1],[8,9]]]]
[[4,[[6,6],4]],[[[9,3],[3,1]],5]]
[[[7,8],1],0]
[[[8,8],[[1,0],7]],[4,6]]
[9,8]
[[[[4,2],9],[[9,9],7]],[7,[9,[5,8]]]]
[[4,[4,[3,3]]],8]
[0,2]
[[4,[5,5]],[9,[[6,9],4]]]
[[[7,3],[[1,2],6]],[[[2,4],[6,7]],[[5,0],9]]]
[[[[2,0],5],[4,5]],[[[6,5],[6,0]],[1,[3,4]]]]
[[3,[6,8]],[[[3,0],0],[[2,8],7]]]
[[[4,[6,2]],[9,[4,1]]],[8,[3,4]]]
[[[6,[6,8]],[7,[2,0]]],[4,[[8,7],[1,6]]]]
[2,[0,[4,0]]]
[[[[0,5],1],8],[[9,[0,3]],3]]
[[[3,[5,2]],[3,[3,2]]],[[[7,3],1],7]]
[1,[[[1,8],[1,7]],0]]
[[8,6],[[0,4],4]]
[[[8,2],[4,6]],3]
[5,[[[7,5],[4,5]],[0,2]]]
[[3,[3,6]],6]
[[[[6,8],[5,7]],[[7,3],5]],[[8,[4,8]],8]]
[[[[5,8],[3,1]],[[3,7],[7,0]]],[[9,7],0]]
[[2,[[5,3],8]],0]
[0,[2,8]]
[[8,9],[[[2,2],[4,7]],[[4,0],1]]]
[[[[3,0],8],[[7,3],[6,1]]],[[3,8],[4,2]]]
[[[[6,7],[4,3]],[[3,9],5]],8]
[[[7,7],[[3,4],7]],[[[0,4],1],9]]
[[[7,5],5],[[2,[9,9]],[0,[3,5]]]]
[[[[3,3],[6,1]],[5,8]],[[4,7],[8,1]]]
[[[0,[7,3]],[6,[7,2]]],[[0,8],7]]
[[[2,7],[9,7]],[8,[3,8]]]
[[[0,2],6],[[9,[6,5]],[[3,9],1]]]
[[7,[[3,4],[2,8]]],[[[4,1],4],7]]
[[3,[[3,4],6]],[[3,9],[[4,5],[3,0]]]]
[[[5,[5,1]],[2,4]],[1,[[1,6],6]]]
[[[5,6],[[1,3],[5,0]]],[[[4,1],8],[5,5]]]
[[[[2,0],7],[[8,9],1]],[[[4,0],[1,6]],1]]
[[[2,0],[[4,2],[9,9]]],[4,9]]
[[[[1,9],6],2],[[5,4],[2,4]]]
[[[[4,1],[4,5]],[[2,3],2]],[3,[[8,8],1]]]
[[[[8,1],0],[2,2]],[[2,[7,1]],1]]
[[[7,4],[[1,3],5]],[[6,8],[[0,0],2]]]
[[[1,2],8],[[[1,7],[4,0]],[[8,2],8]]]
[[[0,8],[3,6]],[[[5,3],7],[9,7]]]
[[4,6],[[[7,9],[7,5]],[[4,6],[8,4]]]]
[[[[7,3],0],[[6,2],[7,2]]],[9,[[8,0],3]]]
[[[3,0],1],[[2,3],1]]
[[[5,[8,6]],[[1,2],2]],[[[1,4],6],[5,[7,1]]]]
[[[[1,5],8],[0,0]],4]
[[[7,[6,8]],3],[[5,1],[[2,8],[4,6]]]]
[3,[[[5,8],[4,5]],[[7,7],8]]]
[[6,[7,[8,2]]],[[9,0],0]]
[[[8,[7,6]],1],[[2,4],6]]
[[[[0,4],2],[0,7]],[6,6]]
[1,[[1,9],[9,3]]]
[[[[5,2],[5,3]],[[9,0],4]],2]
[[[[5,5],3],[7,[1,2]]],[6,[7,2]]]
[[[[2,1],3],8],[[2,[8,2]],[7,4]]]
[[8,[9,[1,8]]],[[[4,4],[0,6]],[6,3]]]
[[[1,6],[1,[2,5]]],0]
[[[[0,1],[7,2]],[[7,2],3]],[2,[[7,8],[0,7]]]]
[[[[1,8],8],[[5,7],[3,4]]],[[[2,5],[7,4]],[[8,4],9]]]
[[[2,2],[5,[1,0]]],[[[6,6],[3,0]],[[8,5],5]]]
[[[[8,2],[4,8]],[9,4]],[[8,[7,9]],0]]
[[3,[5,[2,4]]],[[[8,1],0],[[0,4],[4,5]]]]
[[5,[9,[3,8]]],[4,[1,[5,2]]]]
[[[3,[0,6]],[7,[8,7]]],[[6,8],[[8,7],0]]]
[[[[0,2],5],[4,6]],3]
[[6,7],[[1,[4,6]],9]]
[7,[3,[[8,8],5]]]