@input = ARGV[0]

@chars = @input.split(//)
@board = [@chars[0..2], @chars[3..5], @chars[6..8]]

def play x, y
  puts y * 3 + x
  exit
end

def must_block_row x, y
  @board[y].count(@them) == 2
end

def must_block_column x, y
  [@board[0][x], @board[1][x], @board[2][x]].count(@them) == 2
end

def must_block_diagonal x, y
  false
end

if @chars.count("0") > @chars.count("x")
  @me = "x"
  @them = "0"
else
  @me = "0"
  @them = "x"
end

@board.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    next unless cell == "-"
    play x, y if must_block_row(x, y) || must_block_column(x, y) || must_block_diagonal(x, y)
  end
end

[4, 0, 2, 6, 8, 1, 3, 5, 7].each do |n|
  if @chars[n] == "-"
    puts n
    exit
  end
end

puts "Arse!"
