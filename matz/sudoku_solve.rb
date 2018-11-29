require_relative 'sudoku'

puts Sudoku.solve(Sudoku::Puzzle.new(ARGF.readlines))

=begin
2..5..8.3
..6.49...
51...2.49
46....915
...1.3...
921....87
83.4...62
...37.5..
6.7..8..4
=end
