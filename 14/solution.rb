initial = DATA.gets.strip.each_char.to_a

RULES = DATA.read.strip.each_line.map { input, output = _1.strip.split(" -> "); [input.each_char.to_a, output] }.to_h

def polymerize1(input) = input.each_cons(2).each_with_object([input.first]) do |pair, output|
  output << RULES[pair] if RULES[pair]
  output << pair.last
end

# Part 1

fill10 = 10.times.inject(initial) { polymerize1(_1) }
tally10 = fill10.tally
puts "Difference between most common and least common after 10 steps: #{tally10.values.max - tally10.values.min}"

# Part 2

def polymerize2(input) = input.each_with_object(Hash.new { |h, k| h[k] = 0 }) do |(pair, value), output|
  fill = RULES[pair]
  if fill
    output[[pair.first, fill]] += value
    output[[fill, pair.last]] += value
  else
    output[pair] += value
  end
end

fill40 = 40.times.inject(initial.each_cons(2).tally) { polymerize2(_1) }
tally40 = fill40.each_with_object(Hash.new { |h, k| h[k] = 0 }) { |(k, v), h| h[k.first] += v; h[k.last] += v }
                .tap { _1[initial.first] += 1; _1[initial.last] += 1 }
                .transform_values { (_1 / 2) }
puts "Difference between most common and least common after 40 steps: #{tally40.values.max - tally40.values.min}"

__END__
ONHOOSCKBSVHBNKFKSBK

HO -> B
KB -> O
PV -> B
BV -> C
HK -> N
FK -> H
NV -> C
PF -> K
FV -> B
NH -> P
CO -> N
HV -> P
OH -> H
BC -> H
SP -> C
OK -> F
KH -> N
HB -> V
FP -> N
KP -> O
FB -> O
FH -> F
CN -> K
BP -> P
SF -> O
CK -> K
KN -> O
VK -> C
HP -> N
KK -> V
KO -> C
OO -> P
BH -> B
OC -> O
HC -> V
HS -> O
SH -> V
SO -> C
FS -> N
CH -> O
PC -> O
FC -> S
VO -> H
NS -> H
PH -> C
SS -> F
BN -> B
BF -> F
NC -> F
CS -> F
NN -> O
FF -> P
OF -> H
NF -> O
SC -> F
KC -> F
CP -> H
CF -> K
BS -> S
HN -> K
CB -> P
PB -> V
VP -> C
OS -> C
FN -> B
NB -> V
BB -> C
BK -> V
VF -> V
VC -> O
NO -> K
KF -> P
FO -> C
OB -> K
ON -> S
BO -> V
KV -> H
CC -> O
HF -> N
VS -> S
PN -> P
SK -> F
PO -> V
HH -> F
VV -> N
VH -> N
SV -> S
CV -> B
KS -> K
PS -> V
OV -> S
SB -> V
NP -> K
SN -> C
NK -> O
PK -> F
VN -> P
PP -> K
VB -> C
OP -> P
