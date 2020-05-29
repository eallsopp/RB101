require 'pry'

INITIAL_MARKER =  ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[2, 5, 8], [1, 4, 7], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]


def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable MEtrics/MethodLength, Metrics/Abcsize
def display_board(brd)
  system 'clear'
  prompt "You are a #{PLAYER_MARKER} and computer is #{COMPUTER_MARKER}"
puts ''
puts '     |     |'
puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
puts '     |     |'
puts '-----+-----+-----'
puts '     |     |'
puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
puts '     |     |'
puts '-----+-----+-----'
puts '     |     |'
puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
puts '     |     |'
puts ''
end
# rubocop:enable MEtrics/MethodLength, Metrics/Abcsize

def initialize_board # this displays the original, empty board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  # each number reps a square onboad, begins empty, num reps a [new_key]
  new_board
end

def empty_squares(brd) # inspects but doesn't modify the board
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt 'Sorry, that is not a valid choice.'
  end

  brd[square] = PLAYER_MARKER # set the value of the square a player chooses
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer' 
    end
  end
  nil # why do we write nil here, instead of end? the returns are manually input
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def scoreboard(wins)
  


loop do
  board = initialize_board # keys represent a square on the board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt 'It\'s a tie!!'
  end


  display_match(brd)
  display_match_score(brd)
  

  prompt 'Play again? (Y or N)'
  answer = gets.chomp
  break unless answer.upcase.start_with?('Y')
end

prompt 'Thanks for playing Ruby Tic Tac Toe!'
prompt 'Goodbye.'
