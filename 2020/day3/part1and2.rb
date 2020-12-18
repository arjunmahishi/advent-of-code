require './traveller.rb'

# Part 1
p Traverler.new('input.txt', 3, 1).travel

# Part 2
p [
  Traverler.new('input.txt', 1, 1).travel,
  Traverler.new('input.txt', 3, 1).travel,
  Traverler.new('input.txt', 5, 1).travel,
  Traverler.new('input.txt', 7, 1).travel,
  Traverler.new('input.txt', 1, 2).travel,
].inject(:*)

