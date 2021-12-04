input = %w[
  6,69,28,50,36,84,49,13,48,90,1,33,71,0,94,59,53,58,60,96,30,34,29,91,11,41,77,95,17,80,85,93,7,9,74,89,18,25,26,8,87,38,68,5,12,43,27,46,62,73,16,55,22,4,65,76,54,52,83,10,21,67,15,47,45,40,35,66,79,51,75,39,64,24,37,72,3,44,82,32,78,63,57,2,86,31,19,92,14,97,20,56,88,81,70,61,42,99,23,98
  22 59  7 10  6 33 36 96 55 23 13 85 18 29 28 75 46 83 73 58 34 40 87 56 98
  73 96 47 14 10 28 11 79 84 20 74 30  0 59 71 80 93 42 22 17 44  2 81 29 15
  73 32 37 93 39 2 87 38 99 97 15 12 42 49 33 9 23 25 94 19 57  4 18 70 79
  43 79 59 71 78 51 97 37 28 26 46 21 84  8 86 96 30 17 34 49 55 90 99 75 61
  43 86 35 51 24 16 25 29 21  3 2 13  4 36 54 89 27  8 85 34 96 59 65 14 56
  5 57 43  4  1 86 80 67 30 20 22 16 99  0 14 40 25 59 91 54 82 95 96 37 24
  97 20 87 66 21 25 40  9 78 89 52 75 95 63 62 32 43 13 47 69 53 48 56 29  4
  24  4 65 12  8 76  3 81 99 49 45 33 31 66 34 17 94 75 35 88 64 10  7 93 95
  88 20 99 15 83 81 40  5  6 98 49 74 18 27  9 43 69 28 37 71 87 82 90 14 47
  21 97 92 42 60 11 65 98 95 29 2 49 75 20 74 56 40 78 66 81 68  4 46 77 61
  26 14 39 76 11 41 74 34 91  4 51  9 97 29 75 83 86 23 35 77 90  2 49 30 89
  34 97  0 22 15 65 60 82 66 47 30  9 49 95 48 54 73 67 17 78 33 96 44  1 32
  90 29 10 49 63 8 26 95 61  0 54 13 51 12 44 32 48 16 47 84 55 46 93 14  3
  68 55 46 16 54 97 59 49  6 21 52 32 15 96 70 57 56 61 51  0 40 31 62 24 48
  75 56 70 42 14 77  9 23 62 25 29 27 54 17  2 55 72 43 15 96 45 30 88 86  1
  65 12 22  6 51 77 81 15 91 19 80 71 27 89 52 75 92 41 83 57 40 44 66 84 98
  89 80 73 59 18 74 55 67 71 10 78 27 37 57  3 92 26 17  5 72 52 83 28 76 51
  64  0 87  4 13 14 43 42 62 31 17 84 72 91 83 53 80 59 61 74 47 22 38 28 77
  65 49 91 94 19 25 81 64 57  9 50 95 82 12 66 53 54 85 36 11 31 56 83 18 60
  6 12 76 37 33 14 96 16 31 40 17 82 27 94 83 1 50 49  9 54 29 70 59 91 77
  85  0 33 41 16 7 86 80 53 65 94 19 28 35 32 4 55 93 97 63 83 22 67 56 36
  28 70 65 17 19 88 51 15 73 12 11 49 80 23 42 26 54 90 75 29 74 77 91 86 66
  88 22 83 10 43 57 34 15 23  8 94 42 68 67 37 84  3  6 71 62 89 45 72 55 38
  68 27 93  7 15 85 96  1 56  6 32  2 30 55 17 99 90 37 80 50 77 78 58 98 57
  5 95 22 13 97 19  2 52 92 20 75 49 86 31 41 51 63 56 33 10 82 27 79 94 57
  15 44 91 26  4 41 78 53 95 86 90 92 46 56 33 80 93 68 66 70 36 10 38  0  6
  11 47 52 64 17 16 60 39 55 78 46 18 33 83 35 13 92  4 23 50 40  5 29  6 90
  20 60  2 23 74 43 39 91 75 12 58 67 50 29 79 10 40 92 95 25 13 24 53 72 36
  69 64 15 53 86 61 11 48 71 27 26 93 38 70 73 96 29 30 98 45 13  7 31 59 84
  13 55 50 54 57 32 24 45  5 77 82 86  0  4 99 75 72 14 40 56 76 94 89 17 30
  66 71 86 41  0 80 64  3 29 78 23 21 42 99 87 96 60 75 61 49 2 83 85 12  1
  78 96  4 82  6 73 36 57 99  8 11 83 15 35 30 85 87 25 22 66 32 64 16 50 43
  6 39 55  2  4 1 61 99 71 80 46 88 22 31 60 62 66 37 97 76 74 34 10 52 24
  42 38 13 65 12 4 39 60 62 21 81 99  1 69 40 59 15 11 95 53 91 78 72 30 73
  43 68 82 72  2 34 92 33 97 89 63 70  9  0 45 69 10 12 65 21 40 20 55 57 49
  41 22  8 16 49 71 64 19 65 92 17 10 26 36 29 30 88  7 54 11 77 55 70 72 47
  15 94 90  6 39 99 55 16 54 91 18  7 82 44 51 25 34 83 14 12 30  2 77 27 66
  44 50 74 97 58 87 42 56 92 28 49 82 52 17 78 54 89 63 77 27 83 14 24 16 84
  47 32  8 55 22 19 14 24 82  4 76 73  9 10 64 40  6 92 67 17 68 44 43  3 54
  26 10  9 92 81 46 98 13  0 14 68 99 35 18 72 74 33 22 61 93 80 38 71  6 75
  17 23 54 55 22 10  8 60 76 24 71 28 16 62 82 13 12 21 78 39 26 66 89 64 79
  72 12 91 79 99 84 18 37 98 41 10 71 88 23 24 11 34 26 83 74 58 27 77  5  8
  9 90 13  0 46 6 58 74 92  8 75 77 56 76 80 55 60 44 68 91 67 28 96 66 18
  14 26 54 21 35 69 67 16 76 62 78 45 87 44 94 27 89 39 85 28 3 81 93 64 74
  10 28 35 84 76 40 11 95 59 57 53  4 24 50 45 7 43 78 17 81 1 74 82 16 27
  6 26 72 53 52 51 91 80 11 18 20 63 74 25 33 79  4  8 59 67 3 13 55 81 83
  98 85 27 84 42 90 15 17 61 34 40 64 86 96 45 59 47 53  5 35 11  7 41 80 13
  47 48 54 31 76 99 32 98 20 15 61 41 30 94 37 34 59 86 55 45 9 83 92 53  3
  3 80 24 94 25 17 23 64 76 71 20 97  0 56 72 95 73 28 59 21 14 81 46 67 88
  2 95  5 38 90 63 62 11 24 34 19 31 57 84 80 47 86 36 85 74 13 39 73 94 42
  28  6 60 34 15 63 36 51 30 92 43 10  7 88 49 78 76 31 19 66 22 20 35 45 79
  19 42 49 57 73 99 50 97 93 43 67 52 40 16 33 2 55  0 71 46 21 75 59 66 83
  19 86 30 25  3 32 39 65 54 29 38  6 85 52 13 43 95 18 44 15 53 70 16 31 71
  68 73 74 83 70 56 15 12 78  4 43 87 63 90 86 41 16 23 17 77 80 14 61 30 50
  88 28 45 80 65 64 11 68 33 27 29 70 44 82 37 42 66  9 32 87 10 24 15  3 46
  99 81  5 62 97 4 36 23 38 35 42 16 37 98 54 34 41 25 30 48 8 60 63 89 72
  25 33 94 23 14 45 10 79 30  3 22 28 95 27 11 74 13 39 84 83 72 88 56 53 97
  31 92 91 84 71 54 90 89 80  0 98 96 65 66 68 35 39 70 11 82 15 34 42 52  2
  68 71 86 82 37 28 48 12 34 54 62 55 10 25 89 60  4 50 21 22 3  2 18 40 84
  18 96 95 47 45 14 51  2 88 43 94 56 19 15  8 48 65 62  6 75 35 28 25 72 30
  43 85 69 92 26 61 75  5 73 66 16 87  4 99 48 18 19 79 23 83 37 88 31 38 40
  23 10 89 84 76 45 39 62 55 66 25 73 79 43 60 12 69 36 93 71 9 77 14 58 49
  9 24 26 53 79 99 15 30 50 16 14 95 12 25 33 54 40 58 46 66 5 23 39 29 48
  64 67 11 10 92 59 99 80 97 66 45 51 88 47 82 35 27 72 85 16 54 58  2  1 52
  10 97 27 54 66 89 85 39 99 98 8 68 95 51 19 4 17 79 87  3 72 43 76 58 33
  95 72  0 18 17 3 42 24 86 34 52 79 46 58 98 76 77 78 19 10 81 61 88 85 54
  74 70 15 80 72 77 89 11 19 22 34 59 56 65 91 58  6 50 40 16 93 30 95 26 85
  47 62 57  6 25 40 79 22 95 29 42 11 70 10 92 60 53 84 96 17 75 86 74 89 18
  30 42  4 19 92 40 58 72  7 70 17 98 45 76 50 93 57 65 79  2 56 94 73 84 62
  51  0 14  7 53 63 36 48 81 84 50 22 11 88  6 83 99 21 31 91 86 17 72 42 94
  83  0 20 26  7 42 24 37 86 65 73 82 63 21 27 30 35  9 47 80 79 53  3 14 84
  50 99 83 86 42 81 36 24  4 76 0 71 66 41 57 7 54 94 78 97 12  8 82 45 31
  4 91 57 50 37 22 46 86 24 26 39 54 48  7 42 2 45 95 29 12 38 25 52  0 72
  51 94 46 44 62 95 60  0 48 61 38 13 85 32  8 22 56 53 30 80 43 65 58 68 88
  49 76 41 43 51 57 46 45 82 90 48 33 36  5 23 81 30  3 61 75 56 70 29 91 59
  58 74 50 47 84 2  1 62 36 60 32 16 95 43 27 79 12 39 56 11 9 33  4 25 61
  23 84 16 51 39 72 19 53 64 43 9 44 10 52 26 45 68 29 56 74 62 42 46 95  0
  16 83 27 85 56 13 41 49 79 53 18 63  7 60  3 45 15 48 69 29 46 86 35 34 32
  85  2 96 15 43 33 30 29 53 98 21 55 61 73 40 31  4 66 75 59 26 32 91 38 80
  69 81 65 30 77 82 22 83  0 38 2  3 29 47 94 42 55  9 18 97 53 45 90 31 44
  23 86  0 35 84 27 80  3 64 12 1 96 48 93 85 69 24 61 15 22 91 72 62 13 76
  81 51 67 60 16 65 48 86 39 97 92 93 49 77 59 15 94 88 52 19 80 83 23 61  4
  47 84 46 79 55 92 38 65 42 76 9 58 26 95 86 30 49 56 69 59 94  4 25 89 44
  73 10 29  0 48 56 40 19 84 61 52 31 25 86 21 79 55 53 51  5 81  9 35 72 15
  41 95 30 58 73 26 80  4 21 96 61 92 76 93 74 2 69 60  8 20 46 98 70 72 83
  1 99 31  4 86 93 64  8 43 61 33 36 75 90 50 52 13  3 42 34 22 65 60 18 76
  17 63  6 66 92 51 67 86 88 18 82 83 32 74 30 5 33  9 28 61 72 75 25 23 60
  43 28 40 53 52 54 12 77 10 83 21 44 63  0  1 15 22 33 49  2 80 41  3 46 55
  1 97 75 37  4 47 33 13 21 40 27 62 15 90 30 11 83 63 36 35 0 12 60 91 42
  0 45 17 88 18 66 10 63 62  8 36  5 47 39 67 21  3 61 29 19 82 58 33  6 59
  37 92 69 56 52 46 66 20 78 13 83 99 16 31  0 36 35  2 68  9 70 82 94 96 29
  62 65 85 37  3 74 95 34 96 58 15 33 49 21 93 19 83 66  6 25 81 84 23  0 76
  95 84 71 92 52 54 36 66 59 82 0 76 32 45 83 69 27 25 88 38 81 96 63  4 61
  73 51 28 48 40 3 38 11 14 35 66 91 86 20 81 53 39 46 71  1 97 60 21 93 23
  92 70  4 60 95 58 49 20 15 25 55 68 21 84 80 56 41 82 23 19 30 74 65 27 29
  81 97 68 46 75 62 73 63 36 41 1  5 91 84 37 45 92 20 49  7 25 26  3 88 56
  25  9 94 37 26 44 58 84 91 38 39 46 57 98 50 96 42 73 24 70 71 32 53 48 13
  98 72 25 96 77 80 64 88 53 23 21 37 45 24 18 41 86 59 68  5 76 50 36 26 12
  77 79 88 74 12 21  9 85 26 68 11 62 64  4  5 47 33 76 63 87 55 19  2 60 95
  74 79 30 14 35 90 52 17 29 63 18 69 78 34 26 92 42 85 71 56 12  2  5  0 98
]

draws = input[0].split(",").map { Integer(_1) }
boards = input[1..-1].map { Integer(_1) }.each_slice(5).each_slice(5).to_a

drawn = []
scores = []
until draws.empty? || boards.empty?
  drawn << draws.shift

  boards.reject! do |board|
    next unless board.any? { |row| (row & drawn) == row } || board.transpose.any? { |col| (col & drawn) == col }
    scores << (board.flatten - drawn).sum * drawn.last
  end
end

puts "First bingo had score: #{scores.first}"
puts "Last bingo had score: #{scores.last}"
